class Lesson < ActiveRecord::Base
  # attr_accessible :title, :summary, :movie, :time, :grade, :category_name, :category_summary, :unit_name, :unit_summary, :unit_item_name, :unit_item_summary, :explanation, :exercise, :exercise_answer, :point, :number
  has_many :learnings

  attr_accessible :exe_pdf
  has_attached_file :exe_pdf
end
