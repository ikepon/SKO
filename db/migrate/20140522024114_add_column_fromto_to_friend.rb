class AddColumnFromtoToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :from, :integer
    add_column :friends, :to, :integer
  end
end
