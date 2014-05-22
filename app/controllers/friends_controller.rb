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

    @search_form = SearchForm.new params[:search_form]
    if params[:commit].present?
      @search_users = User.where.not(:id => @user_id)
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

    if user_signed_in?
      if @user_id > @friend_id
        @relation = Friend.where("user_id1 = ? and user_id2 = ?", @friend_id, @user_id).first_or_create do |l|
          l.user_id1 = @friend_id
          l.user_id2 = @user_id
          l.status = nil
        end
      else
        @relation = Friend.where("user_id1 = ? and user_id2 = ?", @user_id, @friend_id).first_or_create do |l|
          l.user_id1 = @user_id
          l.user_id2 = @friend_id
          l.status = nil
        end
      end
    end

  end

  private

      def learning_params
          params[:learning].permit(:user_id, :lesson_id, :status, :memo, :check, :complete_data)
      end

end
