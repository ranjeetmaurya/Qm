class UserNeed < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :offering
  belongs_to :need
end
