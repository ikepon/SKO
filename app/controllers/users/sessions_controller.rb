class Users::SessionsController < Devise::SessionsController

  include ApplicationHelper

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new

    #sidebar
    @new_lessons = Lesson.select('grade, unit_name, unit_item_name, created_at').order('created_at DESC').limit(3)
    @popular_lessons_all = Learning.select('lesson_id').group('lesson_id').order('count_lesson_id DESC').count('lesson_id').keys
    # @popular_lessons = Lesson.find(@popular_lessons_all).select('lesson_grade, lesson_unit_name')

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

    super
  end

  def destroy
    super
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
  end
end