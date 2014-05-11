class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id1, :null => false, :default => ""
      t.integer :user_id2, :null => false, :default => ""
      t.boolean :status, :null => false, :default => "false"

      t.timestamps
    end
  end
end
