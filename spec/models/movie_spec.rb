require 'spec_helper'

describe Movie do
	before do
		@movie = Movie.new
		@movie_with_name = Movie.new(name:"Casablanca")

	end

	it "must have a name" do
		expect(@movie.valid?).to be_false
	end

	it "must have a name" do 
		expect(@movie_with_name.valid?).to be_true
	end

	it "must have a name" do
		should validate_presence_of(:name)
	end

	it "can have schedule times" do 
		should have_many(:schedules)
	end

end
