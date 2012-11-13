class TaxonomiesController < ApplicationController
  
  def index
    @user = User.find(session[:user_id])
    
    @taxonomies = Taxonomy.find(:all)
    
    # defining datatable that goes into createTable call 
    # (assets/javascripts/application.js.erb)
    @datatable = "taxonomylist"
    
    if (params[:id])
      @taxonomy = Taxonomy.find(:all)
    end
  end
  
  def edit
    @taxonomy = Taxonomy.find(params[:id])
    
    if (@taxonomy == nil)
      redirect_to "index", flash[:notice] => "The term was not found"
    end
  end
  
  def destroy
    @taxonomy = Taxonomy.find(params[:id])
    if @taxonomy 
      name = @taxonomy.name
      destroy(@taxonomy)
      redirect_to "index", flash[:notice] => "Successfully deleted " + name
    else 
      redirect_to "index", flash[:notice] => "Error deleting taxonomy term"
    end
  end
end