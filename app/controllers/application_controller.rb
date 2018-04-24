class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  # Return current user if exists, if not, find the user in the database based on the user ID
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  # Returns true if it's the current user, false if it's not
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
