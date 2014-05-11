class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :friend, index: true
      t.references :user, index: true
      t.string :message_content, :null => false, :default => ""

      t.timestamps
    end
  end
end
