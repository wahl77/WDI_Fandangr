class ReservationsController < ApplicationController
  
  skip_before_filter :require_authentication, only:[:get_values, :create]
  
  def create
    if session[:user_id].nil?
      @str = "Please log in"
      flash.now[:alert] = "You must be logged in to make a reservation"
    else 
		  reservation = Reservation.new
		  reservation.user = current_user
		  reservation.schedule = Schedule.find(params["schedule"])
      
		  seats = params["cell"].split("-")
      seat = Seat.new(:pos_x => seats[0], :pos_y => seats[1])
      
      if reservation.is_valid_seat? seat
        reservation.seat = reservation.schedule.room.seats.where("pos_x = ? and pos_y = ?", Integer(seats[0]), Integer(seats[1])).first()
        reservation.save
        @str = "Ok"
      else 
        @str = "Seat is already take"
      end
    end
  end
  
  def get_values
   schedule = Schedule.find(params["schedule"])
	 @array = []
	 schedule.reservations.each do |reservation|
	   @array << [reservation.seat.pos_x, reservation.seat.pos_y]
	 end
  end
  
end
