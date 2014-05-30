# coding utf-8

class LearningsController < ApplicationController
  add_breadcrumb 'Home', '/'

  protect_from_forgery

  before_filter :set_search
  before_filter :authenticate_user!

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index

    add_breadcrumb 'マイページ'

    @title = '学習状況マイページ'
    @description = '個人の学習状況を確認するページです。'

    @user_id = current_user.id

    @chart_data_day = Learning.where("user_id = ? and status = ?", @user_id, true).group('date(complete_date)').count
    @columun = 0
    @accumulation = 0
    @chart_data_accumulation = @chart_data_day.to_a
    @chart_data_day.each do |day|
      @chart_data_accumulation[@columun][0] = day[0]
      @chart_data_accumulation[@columun][1] = day[1] + @accumulation
      @accumulation = @chart_data_accumulation[@columun][1]
      @columun += 1
    end

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

    @learning_ids = Learning.where("user_id = ? and status = ?", @user_id, true).group('lesson_id').count('lesson_id').keys

    @lessons1 = Lesson.where(:grade => '1').select('grade, unit_name, unit_item_name').group('unit_item_name')
    @lessons2 = Lesson.where(:grade => '2').select('grade, unit_name, unit_item_name').group('unit_item_name')
    @lessons3 = Lesson.where(:grade => '3').select('grade, unit_name, unit_item_name').group('unit_item_name')

    @l_unit_names1 = Lesson.where(:grade => '1', :id => @learning_ids).group('unit_item_name').count
    @unit_count1 = Lesson.where(:grade => '1').group('unit_item_name').count
    @l_unit_names2 = Lesson.where(:grade => '2', :id => @learning_ids).group('unit_item_name').count
    @unit_count2 = Lesson.where(:grade => '2').group('unit_item_name').count
    @l_unit_names3 = Lesson.where(:grade => '3', :id => @learning_ids).group('unit_item_name').count
    @unit_count3 = Lesson.where(:grade => '3').group('unit_item_name').count

    @sum_time = 0
    @times = Lesson.where(:id => @learning_ids).select('time')

    if @times.present?
      @times.each do |t|
        @sum_time += t.time.min * 60 + t.time.sec
      end
    end

    @total_time = Time.now.midnight.advance(:seconds => @sum_time).strftime('%T')

  end

  def memo

    add_breadcrumb '学習メモ・チェックレッスン'

    @title = '学習メモ・チェックレッスン'
    @description = '各レッスンでのメモやチェックしたレッスン一覧を表示します。'

    @user_id = current_user.id

    @memos = Learning.where("user_id = ? and memo not ?", @user_id, nil).select('lesson_id, memo')
    if @memos.present?
      @memos = {}
    end

    @checks = Learning.where(:user_id => @user_id, :check => true).select('lesson_id')

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

  end

  def create
    @learning = Learning.new(learning_params)
    if @learning.save
      status = 'success'
      # redirect_to :back
    else
      status = 'error'
      # render :template => "params[:controller]/params[:action]", :locals => {:learning => @learning}
    end
    render json: { status: status, data: @learning }
  end

  def update
    @learning = Learning.find(params[:id])
    if params[:learning][:check].present?
      check = params[:learning][:check]
    end
    if params[:learning][:status].present?
      complete = params[:learning][:status]
      if complete == 'true'
        params[:learning][:complete_date] = Time.now
      end
    end

    if @learning.update(learning_params)
      status_s = 'success'
    else
      status_s = 'error'
    end
    @learning = Learning.find_by_id(params[:id])

    if check.present?
      render 'learnings/check'
    elsif complete.present?
      render 'learnings/complete'
    end
  end

  def check_lesson_info

  end

  private

      def learning_params
          params[:learning].permit(:user_id, :lesson_id, :status, :memo, :check, :complete_date)
      end

 end
