class Seat < ActiveRecord::Base
  belongs_to :room
  attr_accessible :pos_x, :pos_y
end
