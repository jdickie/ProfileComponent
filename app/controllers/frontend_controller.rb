# Controller for the root index page
class FrontendController < ActionController::Base
  protect_from_forgery
  
  def index
    @people = Person.find(:all)
    
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end 