require 'spec_helper'

describe Seat do
	it "belong to a room" do
		should belong_to(:room) 
	end

	it "must have a position" do
		should validate_presence_of(:pos_x)
		should validate_presence_of(:pos_y)
	end


	it "should have a position" do
		should validate_numericality_of(:pos_x)
		should validate_numericality_of(:pos_y)
	end


#  pending "add some examples to (or delete) #{__FILE__}"
end
