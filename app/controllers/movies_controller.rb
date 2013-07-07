class MoviesController < ApplicationController
  def new
		@movie = Movie.new
  end

  def create
		@movie = Movie.new(params[:movie])
		
		if @movie.save
		  redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end


end
