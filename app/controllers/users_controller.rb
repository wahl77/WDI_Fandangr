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
	end

  def destroy
		redirect_to root_path
  end

  def update
		redirect_to root_path
  end
end
