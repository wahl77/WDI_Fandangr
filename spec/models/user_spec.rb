require 'spec_helper'

describe User do
	before do
		@user = User.new(uun:"Max", password:"Hey")
	end

	it "can be created" do 
		expect(@user.valid?).to be_true;
	end

	it "must be unique" do
		should validate_uniqueness_of(:uun) 
	end

	it "must have a username"  do
		should validate_presence_of(:uun) 
	end

	it "must not be admin initially" do 
		expect(@user.is_admin?).to be_false
	end

	it "can be set as an admin" do 
		@user.is_admin = true
		expect(@user.is_admin).to be_true
	end

	it "has multiple reservations" do
		should have_many(:reservations)
	end

	it { should_not allow_mass_assignment_of(:is_admin) } 

	it "should have movies" do
		should have_many(:movies).through(:schedules)
		should have_many(:schedules).through(:reservations)
	end 

end
