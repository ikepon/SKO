ActiveAdmin.register Faq do

  permit_params :question, :answer, :faq_category_id

  active_admin_importable

  index do
    column :id
    column :question
    column :answer
    column :faq_category
    default_actions
  end

  csv do
    column :id
    column :question
    column :answer
    column :faq_category_id
    column :created_at
    column :updated_at
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
