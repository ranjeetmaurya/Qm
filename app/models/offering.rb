class Offering < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user
end
