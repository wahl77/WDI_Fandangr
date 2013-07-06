class User < ActiveRecord::Base
	has_secure_password

	has_many :reservations
	has_many :schedules, through: :reservations
	has_many :movies, through: :schedules

  attr_accessible :password_confirmation, :password, :uun

	validates :uun,
		presence:true,
		uniqueness:true



end
