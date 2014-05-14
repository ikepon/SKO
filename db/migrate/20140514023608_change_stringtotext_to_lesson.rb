class ChangeStringtotextToLesson < ActiveRecord::Migration
  def self.up
    change_column( :lessons, :summary, :text)
    change_column( :lessons, :category_summary, :text)
    change_column( :lessons, :unit_summary, :text)
    change_column( :lessons, :unit_item_summary, :text)
    change_column( :lessons, :explanation, :text)
    change_column( :lessons, :exercise, :text)
    change_column( :lessons, :exercise_answer, :text)
    change_column( :lessons, :point, :text)
  end

  def self.down
    change_column( :lessons, :summary, :string)
    change_column( :lessons, :category_summary, :string)
    change_column( :lessons, :unit_summary, :string)
    change_column( :lessons, :unit_item_summary, :string)
    change_column( :lessons, :explanation, :string)
    change_column( :lessons, :exercise, :string)
    change_column( :lessons, :exercise_answer, :string)
    change_column( :lessons, :point, :string)
  end
end
