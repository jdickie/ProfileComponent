class PeopleController < ApplicationController
 
  def new
    @person = Person.new
    @person.notes.build
    
    address = @person.addresses.build
    email = @person.emails.build
    telephone = @person.telephones.build
  end
  
  def show
    if params[:id]
      @person = Person.find(params[:id])
      respond_to do |format|
        format.html { redirect_to "people/#{@person.id}" }
      end
    else 
      @people = Person.find(:all)
      respond_to do |format|
        if @people
          format.html # show.html.erb
        else
          format.html { redirect_to "people", :message => "Error displaying data" } 
        end 
      end
    end
    
    
  end
  
  # Typical create statement, except here we are 
   # joining together address, emails, emergency contact,
   # telephone
   def create
     @person = Person.new(params[:person])
     
     respond_to do |format|
       if @person.save
         format.html { redirect_to "people/#{@person.id}" }
         format.json { render :nothing }
         format.xml { render :nothing }
       else 
         format.html { render :action => "new" }
       end
     end
   end
   
   def edit 
     @person = Person.find(params[:id])
   end
   
   def update 
     @person = Person.find(params[:id])
     
     respond_to do |format|
       if @person.update_attributes(params[:person])
         format.html { redirect_to @person, :message => 'Successfully saved changes.' }
         format.json { head :no_content }
       else 
         format.html { render :action => "edit" }
       end
     end
   end
   
   def destroy
    @person = Person.find(params[:id])
    @person.destroy
    
    respond_to do |format|
      format.html { redirect_to people_url }
    end
   end
   
end
