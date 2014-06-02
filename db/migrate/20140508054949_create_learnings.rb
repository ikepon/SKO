class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.references :user, index: true
      t.references :lesson, index: true
      t.boolean :status, :null => false, :default => false
      t.string :memo, :null => false, :default => ""
      t.boolean :check, :null => false, :default => false
      t.datetime :complete_date

      t.timestamps
    end
  end
end
