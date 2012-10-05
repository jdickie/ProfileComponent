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
  
  def get_allowed_menu_items(params)
    unless session[:user_id]
      return false
    else
      a = Array.new()
      u = User.find(session[:user_id])
      if (u)
        # check permissions against menu items
        
      else
        return false
      end
      return a
    end
  end
  
end
