class UsersController < ApplicationController
	skip_before_filter :require_authentication, only:[:new, :create]
  def new
		@user = User.new
  end

  def create
		@user = User.create(params[:user])
		session[:user_id] = @user.id
		redirect_to root_path
  end

  def edit
		redirect_to root_path
  end
	
	def show
		@my_hash = {}

		current_user.reservations.each do |reservation|
			@my_hash[reservation.schedule_id] = [Schedule.find(reservation.schedule_id).movie, Reservation.where("schedule_id = ? AND user_id = ?", reservation.schedule_id, current_user.id).count, Schedule.find(reservation.schedule_id)]
		end
	end

  def destroy
		redirect_to root_path
  end

  def update
		redirect_to root_path
  end
end
