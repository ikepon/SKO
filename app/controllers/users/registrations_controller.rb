class Users::RegistrationsController < Devise::RegistrationsController

  include ApplicationHelper

  before_filter :set_search
  before_filter :configure_permitted_parameters

  protect_from_forgery

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new

    super

    #search
    @search = ''
    if params[:q] != ''
      @search = Lesson.search(params[:q])
      @search_lessons = @search.result.page(params[:page]).per(3)
    end

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

  def edit

    super

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

  # def create
  #   super
  # end

  # def resource_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :remember_me, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag)
  # end
  # private :resource_params

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name,
        :email, :password, :password_confirmation, :current_password)
    end
  end

  # def sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag) }
  #   super
  # end

  # def account_update_params
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag) }
  #   super
  # end
end