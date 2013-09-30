class SessionsController < ApplicationController
  def new #GET/login

  end

  def create #POST/login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You've logged in."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong, try again."
      redirect_to login_path      
    end    
  end

  def destroy #GET/Log
    session[:user_id] = nil
    flash[:error] = "Logged out"
    redirect_to root_path    
  end

end