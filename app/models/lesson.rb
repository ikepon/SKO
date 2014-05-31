class Lesson < ActiveRecord::Base
  # attr_accessible :title, :summary, :movie, :time, :grade, :category_name, :category_summary, :unit_name, :unit_summary, :unit_item_name, :unit_item_summary, :explanation, :exercise, :exercise_answer, :point, :number
  has_many :learnings

  has_attached_file :exe_pdf
  validates_attachment_content_type :exe_pdf, :content_type => ["application/pdf"]

end
