class UsersController < ApplicationController
  protect_from_forgery
  
  before_filter :confirm_logged_in
  
  def new
    @user = User.new
  end
  
  def index
    @user = User.find(session[:user_id])
    @users = User.find(:all)
    
    @datatable = "user_table"
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(:id)
    @user.delete()
  end
  
  def fetch_roles(id='')
    u = User.find(id)
    
    if (u)
      return u.roles
    else
      return false
    end
  end
  
  def fetch_permissions(id='')
    u = User.find(id)
   
    if (u)
      params = Array.new
      u.roles.each do |r| 
        params.push(r.role_has_permission.collect { |p| r.id })
      end
      return params
    else 
      return false
    end
  end
  
end
