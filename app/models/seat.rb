class Seat < ActiveRecord::Base
  belongs_to :room
  
  attr_accessible :pos_x, :pos_y

	validates :pos_x,
		presence:true,
		numericality:{greater_than:0}

	validates :pos_y,
		presence:true,
		numericality:{greater_than:0}
end
