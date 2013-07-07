class Room < ActiveRecord::Base
  attr_accessible :name
  
  has_many :seats, dependent: :destroy
	has_many :schedules

	validates :name,
		presence:true,
		uniqueness:true
end
