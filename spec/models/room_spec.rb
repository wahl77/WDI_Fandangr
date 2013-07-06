require 'spec_helper'

describe Room do
	before do
		@room = Room.new(name:"Room1")
		@room_invalid = Room.new()
	end

	it "should have many seats" do
		should have_many(:seats) 
	end

  # This is the same as next method
	it "should have a name" do 
		expect(@room.valid?).to be_true
		expect(@room_invalid.valid?).to be_false
	end


	it "should have a name" do
		should validate_presence_of(:name)
	end

	it "should have schedules" do
		should have_many(:schedules)
	end

	
#  pending "add some examples to (or delete) #{__FILE__}"
end
