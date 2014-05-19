class ChangeNameetcOptionToUser < ActiveRecord::Migration
  def up
    change_column :users, :name, :string, null: true
    change_column :users, :user_auth, :boolean, null: true
    change_column :users, :sex, :string, null: true
    change_column :users, :grade, :integer, null: true
    change_column :users, :prefecture, :string, null: true
    change_column :users, :mailmag, :boolean, null: true
  end

  def down
    change_column :users, :name, :string, null: false
    change_column :users, :user_auth, :boolean, null: false
    change_column :users, :sex, :string, null: false
    change_column :users, :grade, :integer, null: false
    change_column :users, :prefecture, :string, null: false
    change_column :users, :mailmag, :boolean, null: false
  end
end
