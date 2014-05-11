class Message < ActiveRecord::Base
  belongs_to :friend
  belongs_to :user

  # attr_accessible :message_content

end
