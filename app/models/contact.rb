class Contact < ActiveRecord::Base
  validates :name, :email, :inquiry, :content, presence: true
end
