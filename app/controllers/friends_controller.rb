# coding utf-8

class FriendsController < ApplicationController

  add_breadcrumb 'Home', '/'

  protect_from_forgery

  before_filter :set_search
  before_filter :authenticate_user!

  def set_search
    @search = Lesson.search(params[:q])
  end

  def index

    add_breadcrumb '友達'

    @user_id = current_user.id


    # 友達
    # Friendテーブル（友達状況）から、友達をのidを取ってくる
    @friend_ids = Friend.where(:to => @user_id, :status => true).pluck(:from)
    # 上記idを元に、Userテーブルから情報を取ってくる
    @friends = User.where("id = ?", @friend_ids)

    # 友達申請
    # Friendテーブル（友達状況）から、友だち申請のあった人（status = false）のidを取ってくる
    @from_friend_ids = Friend.where(:to => @user_id, :status => false).pluck(:from)
    # 上記idを元にUserテーブルから情報を取ってくる
    @from_friends = User.where(:id => @from_friend_ids)

    # Newの表示
    @time_now = Time.now.to_i
    # Newの表示日
    dif_day = 3
    @new_period = 60 * 60 * 24 * dif_day

    @from_friend_times = Friend.where(:to => @user_id, :status => false).pluck(:created_at)

    @new_disp = false
    @from_friend_times.each do |t|
      if @time_now - t.to_i < @new_period
        @new_disp = true
      end
    end

    @search_form = SearchForm.new params[:search_form]
    if params[:commit].present?
      @except_ids = []
      @user_ids2 = Friend.where(:status => true, :user_id1 => @user_id).pluck(:user_id2)
      @user_ids1 = Friend.where(:status => true, :user_id2 => @user_id).pluck(:user_id1)
      if @user_ids2.present?
        @except_ids.push(@user_ids2)
      end
      if @user_ids1.present?
        @except_ids.push(@user_ids1)
      end
      @except_ids.push(@user_id)
      @search_users = User.where.not(:id => @except_ids)
      @search_users = @search_users.named @search_form.q
      sex = Array
      if params[:search_form][:male] == '1' || params[:search_form][:female] == '1'
        if params[:search_form][:male] == '1'
          sex = '男性'
        end
        if params[:search_form][:female] == '1'
          sex = '女性'
        end
        if params[:search_form][:male] != '1' || params[:search_form][:female] != '1'
          @search_users = @search_users.where(:sex => sex)
        end
      end
      if params[:grade].present?
        @search_users = @search_users.where(:grade => params[:grade])
      end
    end
  end

  def show

    add_breadcrumb '友達', friends_path
    add_breadcrumb '友達詳細'

    @user_id = current_user.id
    @friend_id = params[:id].to_i

    @friend_info = User.where(:id => @friend_id)

    # プロフィール表示
    @chart_data_day = Learning.where("user_id = ? and status = ?", @friend_id, true).group('date(complete_date)').count
    @columun = 0
    @accumulation = 0
    @chart_data_accumulation = @chart_data_day.to_a
    @chart_data_day.each do |day|
      @chart_data_accumulation[@columun][0] = day[0]
      @chart_data_accumulation[@columun][1] = day[1] + @accumulation
      @accumulation = @chart_data_accumulation[@columun][1]
      @columun += 1
    end

    @sum_time = 0
    @learning_ids = Learning.where("user_id = ? and status = ?", @friend_id, true).group('lesson_id').count('lesson_id').keys
    @times = Lesson.where(:id => @learning_ids).select('time')
    @complete_lessons = @learning_ids.count

    if @times.present?
      @times.each do |t|
        @sum_time += t.time.min * 60 + t.time.sec
      end
    end

    @total_time = Time.now.midnight.advance(:seconds => @sum_time).strftime('%T')

    # 友達状況
    if user_signed_in?
      if @user_id > @friend_id

        @friend = Friend.where("user_id1 = ? and user_id2 = ?", @friend_id, @user_id).first_or_create do |l|
          l.user_id1 = @friend_id
          l.user_id2 = @user_id
          l.status = nil
        end
      else
        @friend = Friend.where("user_id1 = ? and user_id2 = ?", @user_id, @friend_id).first_or_create do |l|
          l.user_id1 = @user_id
          l.user_id2 = @friend_id
          l.status = nil
        end
      end
    end
  end

  def create
      @friend = Friend.new(friend_params)
      if @friend.save
      redirect_to :back
    else
      render :template => "params[:controller]/params[:action]", :locals => {:friend => @friend}
    end
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
      redirect_to :back
    else
      render :template => "params[:controller]/params[:action]", :locals => {:friend => @friend}
    end
  end

  private

      def friend_params
          params[:friend].permit(:user_id1, :user_id2, :status, :from, :to)
      end

end
