class FaqCategory < ActiveRecord::Base
  # attr_accessible :faq_category_name, :faq_category_summary
  has_many :faq
end
