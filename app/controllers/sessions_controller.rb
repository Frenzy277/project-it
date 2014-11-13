class SessionsController < ApplicationController
  
  def create
    user = User.find_by username: params[:username]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You've logged in."
      redirect_to projects_url
    else
      flash[:danger] = "Incorrect username or password."
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've logged out."
    redirect_to root_url
  end
end