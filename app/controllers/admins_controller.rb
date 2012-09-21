class AdminsController < ApplicationController
  protect_from_forgery
  def create 
    
  end
  
  def show
    @users = User.find(:all)
  end
  
end
