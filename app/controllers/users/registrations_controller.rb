class Users::RegistrationsController < Devise::RegistrationsController

  before_action :set_search
  before_action :configure_permitted_params, only: [:create, :update]

  protect_from_forgery

  def set_search
  @search = Lesson.search(params[:q])
  end

  def new
    @title = "新規会員登録"
    @description = "新規会員登録ページとなります。"
    super
  end

  def edit
    @title = "会員情報の確認と変更"
    @description = "会員情報の確認と変更をするページとなります。"
    super
  end

  def create
    super
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    #if update_resource(resource, account_update_params)
    if resource.update_without_current_password(account_update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag,
        :email, :password, :password_confirmation, :comment)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag,
        :email, :password, :password_confirmation, :current_password, :comment)
    end
  end
end