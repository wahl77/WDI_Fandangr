class Schedule < ActiveRecord::Base
  belongs_to :movie
  belongs_to :room
  attr_accessible :playing_day, :playing_time
end
