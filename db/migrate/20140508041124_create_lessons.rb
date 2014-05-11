class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title, :null => false
      t.string :summary, :null => false
      t.string :movie
      t.time :time
      t.integer :grade, :null => false
      t.string :category_name, :null => false
      t.string :category_summary, :null => false
      t.string :unit_name, :null => false
      t.string :unit_summary, :null => false
      t.string :unit_item_name, :null => false
      t.string :unit_item_summary, :null => false
      t.string :explanation, :null => false
      t.string :exercise, :null => false
      t.string :exercise_answer, :null => false
      t.string :point, :null => false
      t.integer :number, :null => false

      t.timestamps
    end
  end
end
