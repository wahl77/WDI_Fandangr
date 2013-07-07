require 'spec_helper'

describe Schedule do
	it "should belong to a movie" do 
		should belong_to(:movie)
	end

	it "should belong to a room" do
		should belong_to(:room)
	end

	it "should have a timestamp" do
		should validate_presence_of(:start_time)
		should validate_presence_of(:end_time)
	end

	it "shows upcoming movies" do
		room = Room.create(name:"Abc")
		movie = Movie.create(name:"Hey", duration:3600)
		schedule = Schedule.new
		schedule.room = room
		schedule.movie = movie
		schedule.start_time = Time.now+2600
		schedule.save
		up_coming = Schedule.showing()
		expect(up_coming.length).to be > 0
	end

	it "should be playing in a room" do
		should validate_presence_of(:room)
	end

	it "should be playing a certain movie" do 
		should validate_presence_of(:movie)
	end
end
