class Movie < ActiveRecord::Base
  attr_accessible :description, :name, :duration
	
	has_many :schedules

	validates :name,
		presence:true,
		uniqueness:true

	validates :duration,
		presence:true,
		numericality:{greater_than:0}

	def playing_at
		schedules = Schedule.where("movie_id = ? AND start_time > ? AND start_time < ? ", self.id, Time.now, Time.now+2*7*24*60*60)
	end
end
