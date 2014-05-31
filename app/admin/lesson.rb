ActiveAdmin.register Lesson do

  permit_params :title, :summary, :movie, :time, :grade, :category_name, :category_summary, :unit_name, :unit_summary, :unit_item_name, :unit_item_summary, :explanation,
    :exercise, :exercise_answer, :point, :number, :exe_pdf

  index do
    column :id
    column :grade
    column :unit_name
    column :unit_item_name
    column :title
    column :summary
    column :number
    column :category_name
    column :exe_pdf_file_name
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Lesson" do
      f.input :title
      f.input :summary
      f.input :movie
      f.input :time, :as => :datetime_picker
      f.input :grade
      f.input :category_name
      f.input :category_summary
      f.input :unit_name
      f.input :unit_summary
      f.input :unit_item_name
      f.input :unit_item_summary
      f.input :explanation
      f.input :exercise
      f.input :exercise_answer
      f.input :exe_pdf, :as => :file
      f.input :point
      f.input :number
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
