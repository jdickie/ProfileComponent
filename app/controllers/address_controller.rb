class AddressController < ApplicationController
  def index
    
    @addresses = Address.find(:all)
    
    
    redirect_to do |format|
      format.html # index.html.erb
      format.json { render :json => @addresses }
    end
  end
  
  def create
    @address = Address.new(params[:address])
    @address.save 
  end
  
  def update
    @address = Address.find(params[:id])
  end
  
end
