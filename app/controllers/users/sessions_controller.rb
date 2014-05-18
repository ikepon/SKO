class Users::SessionsController < Devise::SessionsController

  include ApplicationHelper

  before_action :set_search, :configure_permitted_params

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new
    super
  end

  def destroy
    super
  end

  protected
  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
  end
end