require 'spec_helper'

describe Schedule do
	it "should belong to a movie" do 
		should belong_to(:movie)
	end

	it "should belong to a room" do
		should belong_to(:room)
	end

	it "should have a timestamp" do
		should validate_presence_of(:playing_at)
	end


	it "shows upcoming movies" do
		room = Room.create(name:"Abc")
		movie = Movie.create(name:"Hey")
		schedule = Schedule.new(playing_at:Time.now+7*24*60*60)
		schedule.room = room
		schedule.movie = movie
		schedule.save
		up_coming = Schedule.showing()
		expect(up_coming.length).to be > 0
	end
end
