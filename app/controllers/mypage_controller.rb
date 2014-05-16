# coding utf-8

class MypageController < ApplicationController

  add_breadcrumb 'Home', '/'

  protect_from_forgery

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def index

    add_breadcrumb 'マイページ'

    @user_id = '1'
    # @user_id = current_user.id

    @chart_data_day = Learning.where(user_id: @user_id).group('date(complete_date)').count
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

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    popular_lessons_ids = Learning.group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    @popular_lessons = Lesson.find(popular_lessons_ids)

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')
  end

  def memo

    add_breadcrumb '学習メモ・チェックレッスン'

    # @memos = Learning.where(user_id: @user_id)select('lesson_id, memo, check, created_at')

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    popular_lessons_ids = Learning.group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    @popular_lessons = Lesson.find(popular_lessons_ids)

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:status => true).count()
    @check_lessons = Learning.where(:check => true).count()
    if @users_total != 0
      @average_comp = @complete_lessons / @users_total
      @average_check = @check_lessons / @users_total
    else
      @average_comp = 0
      @average_check = 0
    end

    #footer
    @footer_grade1 = Lesson.where(:grade => '1').select('unit_name').group('unit_name')
    @footer_grade2 = Lesson.where(:grade => '2').select('unit_name').group('unit_name')
    @footer_grade3 = Lesson.where(:grade => '3').select('unit_name').group('unit_name')
    @footer_categories = Lesson.select('category_name').group('category_name')
  end
end
