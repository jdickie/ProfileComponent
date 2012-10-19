class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  # used across the application to check if a user is
  # logged in. 
  #
  # In order to protect your application component, insert:
  #
  #   before_filter :confirm_logged_in
  #
  # ...at the beginning of your controller
  # 
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "You will need to log in with your UID and password."
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end
  
  def current_user
    return User.find(session[:user_id])
  end
  
end
