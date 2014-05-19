class Users::PasswordsController < Devise::PasswordsController

  include ApplicationHelper

  before_filter :set_search

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new
    super
  end

  def edit
    super
  end

  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :remember_me, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag, :reset_password_token)
  end
  private :resource_params

end