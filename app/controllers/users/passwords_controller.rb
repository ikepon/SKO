class Users::PasswordsController < Devise::PasswordsController

  include ApplicationHelper

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new
    #search
    @search = ''
    if params[:q] != ''
      @search = Lesson.search(params[:q])
      @search_lessons = @search.result.page(params[:page]).per(3)
    end

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

  def edit
    #search
    @search = ''
    if params[:q] != ''
      @search = Lesson.search(params[:q])
      @search_lessons = @search.result.page(params[:page]).per(3)
    end

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

  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :remember_me, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag, :reset_password_token)
  end
  private :resource_params

end