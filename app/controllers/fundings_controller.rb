class FundingsController < ApplicationController
  def show 
    @fundings = Funding.find(:all)
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def new 
    @funding = Funding.new
    @people = Person.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create 
    @funding = Funding.create(params[:funding])
  end
  
  def to_label
    "#{first_name}: {date_of_birth}" 
  end
end
