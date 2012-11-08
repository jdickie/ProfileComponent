class UsersController < ApplicationController
  protect_from_forgery
  
  before_filter :confirm_logged_in
  
  # adds a before_filter to every action to authorize the action for this user
  load_and_authorize_resource
  
  def new
    @user = User.new
  end
  
  def index
    @user = User.find(session[:user_id])
    @users = User.find(:all)
    
    @datatable = "user_table"
  end
  
  def create(params)
    @user = User.create({
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    })
    
    if (@user)
      if (params[:roles])
        @user>>params[:roles]
        redirect_to "index", flash[:notice] => "Successfully created user #{@user.username}"
      end
    else
      redirect_to "new", flash[:notice] => "Error creating user"
    end
   
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
