class SchedulesController < ApplicationController
  
  skip_before_filter :require_authentication, only:[:show]
  
  def new
		@schedule = Schedule.new
  end

  def create
		@schedule = Schedule.new(params[:schedule])
		if @schedule.save
			redirect_to root_path
		else
			render :new
		end
  end

	def show
		@schedule = Schedule.find(params[:id])
		@room = @schedule.room
	end

  def update
  end

  def destroy
  end

  def edit
  end
end
