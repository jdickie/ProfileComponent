class UsersController < ApplicationController
  protect_from_forgery
  
  before_filter :confirm_logged_in
  
  # adds a before_filter to every action to authorize the action for this user
  load_and_authorize_resource :unless => :index
  
  def new
    authorize! :create, User
    
    @user = User.new
  end
  
  def index
    if(authorize!(:view_own, User) && authorize!(:view_all, User))
      @user = User.find(session[:user_id])
      @users = User.find(:all)
    
      @datatable = "user_table"
      flash[:notice] = "authorized access"
    else
      flash[:notice] = "Unauthorized access"
      redirect_to :controller => "dashboard", :action => "index"
    end
  end
  
  def create(params)
    unless(authorize!(:view_all, User) &&
      authorize!(:assign_roles, User) &&
      authorize!(:create, User))
      redirect_to "index", flash[:notice] => "You dont have permissions to do that, sorry."
    end
    
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
    
    unless authorize! :view_all, User
      redirect_to "index", flash[:notice] => "You dont have permissions to do that, sorry."
    end
    
    @roles = Role.find(:all)
    @user = User.find(params[:id])
  end
  
  def destroy
    unless authorize! :destroy, User
      redirect_to "index", flash[:notice] => "You dont have permissions to do that, sorry."
    end
    
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
  
  def edit_permissions
    unless(authorize!(:view_all, User) && authorize!(:assign_roles, User) && authorize!(:edit_all, User))
      redirect_to "index", flash[:notice] => "You dont have permissions to do that, sorry."
    end
    @roles = Role.find(:all)
    @permissions = Permission.find(:all)
  end
end
