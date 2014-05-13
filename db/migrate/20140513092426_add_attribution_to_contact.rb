class AddAttributionToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :inquiry, :integer
  end
end
