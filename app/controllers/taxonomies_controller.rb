class TaxonomiesController < ApplicationController
  
  def index
    @user = User.find(session[:user_id])
    
    @taxonomies = Taxonomy.find(:all)
    if (params[:id])
      @taxonomy = Taxonomy.find(:all)
    end
  end
  
  def edit
    @taxonomy = Taxonomy.find(:all)
  end
  
  def destroy
    
    @taxonomy = Taxonomy.find(params[:id])
    if @taxonomy 
      name = @taxonomy.name
      destroy(@taxonomy)
      redirect_to "index", :flash => "Successfully deleted " + name
    else 
      redirect_to "index", :flash => "Error deleting taxonomy term"
    end
  end
end