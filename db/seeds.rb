# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

casablanca = Movie.new(name:"Casablanca", duration:3600)
matrix = Movie.new(name:"Matrix", duration:3000)

casablanca.save
matrix.save

room = Room.create(name:"A")
5.times do |x| 
	5.times do |y| 
		seat = Seat.new
		seat.pos_x = x-1
		seat.pos_y = y-1
		room.seats << seat
	end
end

room = Room.create(name:"B")
7.times do |x| 
	7.times do |y| 
		seat = Seat.new
		seat.pos_x = x-1
		seat.pos_y = y-1
		room.seats << seat
	end
end


start_time = Time.now + 1*7*24*60*60
schedule = Schedule.new
schedule.movie = matrix
schedule.room = room
schedule.start_time = start_time
schedule.save

tmp = User.create(uun:"a", password:"a")


