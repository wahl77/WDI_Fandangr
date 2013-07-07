class Movie < ActiveRecord::Base
  attr_accessible :description, :name, :duration, :plot, :rating
	
	has_many :schedules

	has_many :reservations, through: :schedules

	validates :name,
		presence:true,
		uniqueness:true

	validates :duration,
		presence:true,
		numericality:{greater_than:0}

  before_save :update_duration
	def playing_at
		schedules = Schedule.where("movie_id = ? AND start_time > ? AND start_time < ? ", self.id, Time.now, Time.now+2*7*24*60*60)
	end
	
	def update_duration
		update_imdb
	  self.duration *= 60
	end
	#def duration=(value)
	#  self.duration = value*60
	#end


	def update_imdb 
		@movies_imdb = Movies::find_by_title(self.name)
		self.duration = @movies_imdb.runtime
		self.name = @movies_imdb.title
		self.description = @movies_imdb.plot
		self.rating = get_rating(@movies_imdb)
		self.poster = @movies_imdb.poster
	end

	def get_rating(movie)
		initial = /imdbRating\"=>\"[0-9]\.[0-9]\"/.match(movie.inspect)[0]
		regex = /[0-9]\.[0-9]/.match(initial)
		return regex
	end
end
