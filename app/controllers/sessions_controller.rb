class SessionsController < ApplicationController
  
  skip_before_filter :require_authentication, only:[:create, :destroy]
  
  def create
    user = User.find_by_uun(params[:uun])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You just logged in, welcome #{user.uun}"
      redirect_to user_path(user)
    else
      flash[:alert] = "Username or password invalid"
      redirect_to root_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You are now logged out"
  end
end


