class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  belongs_to :seat
  # attr_accessible :title, :body
end
