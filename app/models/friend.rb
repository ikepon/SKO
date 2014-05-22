class Friend < ActiveRecord::Base
  # attr_accessible :status, :user_id1, :user_id2

  belongs_to :user1, :class_name => 'User' , :foreign_key => 'user_id1'
  belongs_to :user2, :class_name => 'User' , :foreign_key => 'user_id2'

  # belongs_to :from, :class_name => 'User' , :foreign_key => 'from'
  # belongs_to :to, :class_name => 'User' , :foreign_key => 'to'

  has_many :messages
end
