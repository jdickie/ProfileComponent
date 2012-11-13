class RolesController < ApplicationController
  def index
    @roles = Role.find(:all)
    @permissions = Permission.find(:all) 
  end
  
  def update
    role = Role.find(params[:id])
    
    if (params[:permissions])
      role.add_permissions(params[:permissions])
    end
     
    redirect_to "index", flash[:notice] => "Successfully changed permissions for #{role.name}" 
  end
end
