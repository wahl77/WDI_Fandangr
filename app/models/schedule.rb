class Schedule < ActiveRecord::Base
  belongs_to :movie
  belongs_to :room

	attr_accessible :start_time, :end_time, :movie_id, :room_id

	validates :start_time,
		presence:true

	validates :end_time,
		presence:true

	validates :movie,
		presence:true

	validates :room,
		presence:true

	validate :no_overlap 

	def self.showing(num_weeks=2)
		schedules = Schedule.where("start_time > ? AND start_time < ? ", Time.now, Time.now+2*7*24*60*60)
	end

	def start_time=(value)
		write_attribute :start_time, value 
		write_attribute :end_time, value + movie.duration
	end

	def no_overlap
		schedules = Schedule.where("room_id = ?", room.id)
		schedules.each do |schedule|
			#if start_time > schedule.start_time && start_time < schedule.end_time
			#	errors.add(:start_time, "Start time overlaps")
			#end
			#if end_time > schedule.start_time && end_time < schedule.end_time
			#	errors.add(:end_time, "End time overlaps")
			#end

			if (start_time..end_time).overlaps?(schedule.start_time..schedule.end_time)
				errors.add(:start_time, "Time are overlapping")
			end
			
		end
	end


end
