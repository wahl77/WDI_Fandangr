class Room < ActiveRecord::Base
  attr_accessible :name
  
  has_many :seats
	has_many :schedules

	validates :name,
		presence:true
end
