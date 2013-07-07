class RoomsController < ApplicationController
  def new
		@room = Room.new
  end

  def create
		@room = Room.create(params[:room])
		redirect_to root_path
  end

  def edit
		redirect_to root_path
  end

  def destroy
		redirect_to root_path
  end

  def update
		redirect_to root_path
  end
end
