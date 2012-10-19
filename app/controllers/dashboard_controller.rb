class DashboardController < ApplicationController
  protect_from_forgery
  
  before_filter :confirm_logged_in
  
  def index 
    @user = User.find(session[:user_id])
  end
  
end