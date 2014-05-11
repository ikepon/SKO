class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :question, :null => false, :default => ""
      t.string :answer, :null => false, :default => ""
      t.references :faq_category, index: true

      t.timestamps
    end
  end
end
