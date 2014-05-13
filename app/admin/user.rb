ActiveAdmin.register User do

  permit_params :name, :email, :password, :password_confirmation, :current_password, :remember_me, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag,
    :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at

  index do
    column :id
    column :name
    column :email
    column :current_sign_in_at
    column :sex
    column :grade
    column :mailmag
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "User" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :sex
      f.input :grade
      f.input :prefecture
      f.input :mailmag
      f.input :avatar, :as => :file, :hint => f.template.image_tag(f.object.avatar.url(:thumb))
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
