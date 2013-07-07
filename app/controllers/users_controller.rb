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
		#Movie.all.each do |movie|
		#	movie.reservations.where("user_id = ?", current_user.id)
		#end
	  #movies_array = Reservation.where("user_id = ?", current_user.id).uniq.pluck(:schedule_id)
	  #movies_array.each do |x|
    #  Reservation.where("user_id = ? AND schedule_id = ?", current_user.id, x).uniq.pluck(:schedule_id)
    #end
	end

  def destroy
		redirect_to root_path
  end

  def update
		redirect_to root_path
  end
end
