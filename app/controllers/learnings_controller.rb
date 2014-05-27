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

    @user_id = current_user.id

    @memos = Learning.where("user_id = ? and memo not ?", @user_id, nil).select('lesson_id, memo')

    @checks = Learning.where(:user_id => @user_id, :check => true).select('lesson_id')

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
    if params[:learning][:complete].present?
      complete = params[:learning][:complete]
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
      render 'learning/complete'
    end
  end

  def check_lesson_info

  end

  private

      def learning_params
          params[:learning].permit(:user_id, :lesson_id, :status, :memo, :check, :complete_data)
      end

 end
