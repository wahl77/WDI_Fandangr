require 'spec_helper'

describe Reservation do
	it "should belong to a user" do
		should belong_to(:user)
	end

	it "should have a schedule" do
		should belong_to(:schedule)
	end

	it "should have a seat" do
		should belong_to(:seat)
	end
end
