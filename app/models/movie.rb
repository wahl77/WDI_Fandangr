class Movie < ActiveRecord::Base
  attr_accessible :description, :name
	
	has_many :schedules

	validates :name,
		presence:true
end
