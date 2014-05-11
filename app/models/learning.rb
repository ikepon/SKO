class Learning < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  # attr_accessible :check, :complete_date, :memo, :status
end
