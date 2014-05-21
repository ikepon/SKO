class Users::RegistrationsController < Devise::RegistrationsController

  before_action :set_search
  before_action :configure_permitted_params, only: [:create]

  protect_from_forgery

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new
    super
  end

  def edit
    super
  end

  def create
    super
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name,
        :email, :password, :password_confirmation, :current_password)
    end
  end
end