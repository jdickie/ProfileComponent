class AccessController < ApplicationController
  layout 'admin'
  
  before_filter :confirm_logged_in, :only => [:menu, :index]
  
  def index
    render('menu')
  end
  
  def menu
  end

  def login
    
  end
  
  def logout
    #TODO: mark the user as logged out
    flash[:notice] = 'You have been logged out'
    redirect_to(:action => 'menu')
  end
  
  # Does the actual heavy-lifting of checking the password against the DB
  def attempt_login
    auth_user = User.authenticate(params[:username], params[:password])
    if auth_user
      # store variables in the session
      session[:user_id] = auth_user.id
      session[:username] = auth_user.username
      flash[:notice] = 'You have successfully logged in'
      redirect_to(:action => 'menu')
      
    else
      flash[:notice] = 'Invalid username/password combination'
      redirect_to(:action => 'login')
    end
    
  end
  
end
