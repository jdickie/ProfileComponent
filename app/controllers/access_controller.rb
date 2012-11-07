class AccessController < ApplicationController
  
  before_filter :confirm_logged_in, :only => [:menu, :index]
  layout('dashboard')
  
  def index
    render('menu')
  end
  
  def menu
    @user = User.find(session[:user_id])
    @users = User.find(:all)
  end

  def login
    render("menu")
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
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
      redirect_to(:action => 'menu')
    end  
  end
  
  def login_guest 
    session[:user_id] = 2
    session[:username] = "guest"
    flash[:notice] = "Logged in as guest"
    redirect_to(:action => 'menu')
  end
  
end