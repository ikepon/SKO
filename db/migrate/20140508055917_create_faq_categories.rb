class CreateFaqCategories < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.string :faq_category_name, :null => false, :default => ""
      t.string :faq_category_summary, :null => false, :default => ""

      t.timestamps
    end
  end
end
