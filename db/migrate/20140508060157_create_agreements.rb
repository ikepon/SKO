class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.string :content, :null => false, :default => ""

      t.timestamps
    end
  end
end
