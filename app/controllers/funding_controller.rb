class FundingController < ApplicationController
  
  def create 
    @fund = Funding.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def show 
    @fundings = Funding.find(:all)
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
