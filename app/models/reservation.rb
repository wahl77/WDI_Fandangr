class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  belongs_to :seat
  # attr_accessible :title, :body
  
  def is_valid_seat? seat
   self.schedule.reservations.each do |reservation|
     if reservation.seat.pos_x == seat.pos_x && reservation.seat.pos_y == seat.pos_y
       return false
     end
   end
   return true
  end
end
