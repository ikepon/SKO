ActiveAdmin.register Message do

  permit_params :friend_id, :user_id, :message_content

  index do
    column :id
    column :friend_id
    column :user_id
    column :message_content
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Message" do
      f.input :friend_id
      f.input :user_id
      f.input :message_content
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
