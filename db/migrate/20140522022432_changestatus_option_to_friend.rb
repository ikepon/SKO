class ChangestatusOptionToFriend < ActiveRecord::Migration
  def up
    change_column :friends, :status, :boolean, null: true
  end

  def down
    change_column :friends, :status, :boolean, null: true
  end
end
