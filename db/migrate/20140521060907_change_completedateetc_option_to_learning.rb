class ChangeCompletedateetcOptionToLearning < ActiveRecord::Migration
  def up
    change_column :learnings, :status, :boolean, null: true
    change_column :learnings, :memo, :text, null: true
    change_column :learnings, :check, :boolean, null: true
    change_column :learnings, :complete_date, :datetime, null: true
  end

  def down
    change_column :learnings, :status, :boolean, null: false
    change_column :learnings, :memo, :text, null: false
    change_column :learnings, :check, :boolean, null: false
    change_column :learnings, :complete_date, :datetime, null: false
  end
end
