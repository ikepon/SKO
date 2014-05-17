class Learning < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson, :order => 'grade'
  # attr_accessible :check, :complete_date, :memo, :status
end
