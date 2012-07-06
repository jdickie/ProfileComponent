class OfficeHoursController < ApplicationController
  def new
    # Generate a calendar date to go with this 
    # office hour record
    CalendarDate.build
    # Person should already exist 
    @office_hour = OfficeHour.new
    
  end
  
  def create
    @office_hour = OfficeHour.create(params[:office_hour])
    
    respond_to do |format|
      if @office_hour.save
        
      else 
        format.html { redirect_to "people/new" }
      end
  end
end
