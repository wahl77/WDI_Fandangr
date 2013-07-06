class Schedule < ActiveRecord::Base
  belongs_to :movie
  belongs_to :room

	attr_accessible :playing_at
  


	validates :playing_at,
		presence:true

	def self.showing(num_weeks=2)
		schedules = Schedule.where("playing_at > ? AND playing_at < ? ", Time.now, Time.now+2*7*24*60*60)
	end

end
