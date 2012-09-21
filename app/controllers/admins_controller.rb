class AdminsController < ApplicationController
  protect_from_forgery
  
  before_filter :confirm_logged_in
  
  def create 
    
  end
  
  def show
    @users = User.find(:all)
  end
  
end
