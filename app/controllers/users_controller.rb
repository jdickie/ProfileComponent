class UsersController < ApplicationController
  protect_from_forgery
  def new
    @user = User.new
  end
  
  def show
    @users = User.find(:all)
  end
  
  def edit
    @user = User.find(:id)
  end
  
  def destroy
    @user = User.find(:id)
    @user.delete()
  end
end
