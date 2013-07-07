class MoviesController < ApplicationController
  def new
		@movie = Movie.new
  end

  def create
		@movie = Movie.create(params[:movie])
		redirect_to root_path
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
