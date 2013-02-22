class Meeting < ActiveRecord::Base
  attr_accessible :meeting_details, :meeting_time
  has_many :users, :through => :user_meetings
  has_many :user_meetings
end
