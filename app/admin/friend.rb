ActiveAdmin.register Friend do

  permit_params :user_id1, :user_id2, :status, :from, :to

  # index do
  #   column :id
  #   column :user_id1
  #   column :user_id2
  #   column :status
  #   column :from
  #   column :to
  #   column :created_at
  #   column :updated_at
  #   default_actions
  # end

  # form do |f|
  #   f.inputs "Learning" do
  #     f.input :user_id
  #     f.input :lesson_id
  #     f.input :status
  #     f.input :memo
  #     f.input :check
  #     f.input :complete_date
  #   end
  #   f.actions
  # end


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
