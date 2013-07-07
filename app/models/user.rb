class User < ActiveRecord::Base
	has_secure_password

	has_many :reservations
	has_many :schedules, through: :reservations
	has_many :movies, through: :schedules

  attr_accessible :password_confirmation, :password, :uun

	validates :uun,
		presence:true,
		uniqueness:true

  def uun=(value)
    write_attribute :uun, value.downcase
  end
  
  def admin?
    return self.is_admin
  end


end
