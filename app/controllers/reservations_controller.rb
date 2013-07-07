class ReservationsController < ApplicationController
  def create
		reservation = Reservation.new
		reservation.user = current_user
		reservation.schedule = Schedule.find(params["schedule"])

		seats = params["cell"].split("-")
		reservation.seat = reservation.schedule.room.seats.where("pos_x = ? and pos_y = ?", Integer(seats[0]), Integer(seats[1])).first()
		reservation.save
		#seat = reservation.schedule.room.seat.where("
  end
  
  def get_values
    schedule = Schedule.find(params["schedule"])
		@str = ""
		schedule.reservations.each do |reservation|
		  @str += reservation.seat.pos_x.to_s + "|" + reservation.seat.pos_y.to_s + ","
		end
  end
  
end
