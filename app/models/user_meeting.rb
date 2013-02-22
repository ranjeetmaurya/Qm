class UserMeeting < ActiveRecord::Base
  attr_accessible :user_id, :meeting_id
  belongs_to :meeting
  belongs_to :user
end
