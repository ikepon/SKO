class Faq < ActiveRecord::Base
  belongs_to :faq_category
  # attr_accessible :answer, :question, :faq_category_id
end
