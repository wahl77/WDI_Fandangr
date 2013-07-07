class AdminsController < ApplicationController
  
  def panel
    if current_user.admin?
      @movie = Movie.new
      @schedule = Schedule.new
    else
      flash[:alert] = "Good try, but you're not an admin"
      redirect_to root_path
    end
  end
end
