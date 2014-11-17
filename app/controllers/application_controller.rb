class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    restricted_area if !logged_in?    
  end

  def require_member
    restricted_area if logged_in? && !@project.users.include?(current_user)           
  end

  def require_manager
    restricted_area if logged_in? && @project.manager != current_user
  end

  private

  def restricted_area
    flash[:danger] = "Restricted area"
    redirect_to root_url
  end
end
