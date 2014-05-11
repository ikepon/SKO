class Users::PasswordsController < Devise::PasswordsController

  include ApplicationHelper

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new
    #search
    @search = Lesson.search(params[:q])
    @search_lessons = @search.result.page(params[:page]).per(5)

    #sidebar
    @new_lessons = Lesson.select('lesson_grade, lesson_unit_name, lesson_unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:lesson_status => true).count()
    @check_lessons = Learning.where(:lesson_check => true).count()
    @average_comp = @complete_lessons / @users_total
    @average_check = @check_lessons / @users_total

    #footer
    @footer_grade1 = Lesson.where(:lesson_grade => '1').select('lesson_unit_name').group('lesson_unit_name')
    @footer_grade2 = Lesson.where(:lesson_grade => '2').select('lesson_unit_name').group('lesson_unit_name')
    @footer_grade3 = Lesson.where(:lesson_grade => '3').select('lesson_unit_name').group('lesson_unit_name')
    @footer_categories = Lesson.select('lesson_category_name').group('lesson_category_name')

    super
  end

  def edit
    #search
    @search = Lesson.search(params[:q])
    @search_lessons = @search.result.page(params[:page]).per(5)

    #sidebar
    @new_lessons = Lesson.select('lesson_grade, lesson_unit_name, lesson_unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

    @users_total = User.all.count()
    @users_grade = User.group('grade').count('grade')

    @complete_lessons = Learning.where(:lesson_status => true).count()
    @check_lessons = Learning.where(:lesson_check => true).count()
    @average_comp = @complete_lessons / @users_total
    @average_check = @check_lessons / @users_total

    #footer
    @footer_grade1 = Lesson.where(:lesson_grade => '1').select('lesson_unit_name').group('lesson_unit_name')
    @footer_grade2 = Lesson.where(:lesson_grade => '2').select('lesson_unit_name').group('lesson_unit_name')
    @footer_grade3 = Lesson.where(:lesson_grade => '3').select('lesson_unit_name').group('lesson_unit_name')
    @footer_categories = Lesson.select('lesson_category_name').group('lesson_category_name')

    super
  end

end