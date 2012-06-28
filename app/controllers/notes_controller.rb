class NotesController < ApplicationController
  def get_all_model_items 
    @all_items = Person.find(:all)
  end
  
  def new 
    @note = Note.new
    get_all_model_items
  end
  
  def show 
    if params[:note_id] 
      @note = Note.find(params[:id])
      @message = params[:message]
      redirect_to # show.html.erb
      
    else 
      @notes = Note.find(:all)
      respond_to do |format|
        format.html # show.html.erb
      end
    end
  end
  
  
  
  def create 
    @note = Note.new(params[:note])
    
    
    if params[:item_type] && params[:item_type] == 'Person'
      @person = Person.find(params[:item_id])
      @note.people<<@person
    
    end
    
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, :message => "Successfully saved note" }
      else 
        format.html { redirect_to :action => 'new', :message => "There was an error saving your note" }
      end
    end
  end
  
  def update 
    @note = Note.find(params[:id])
    
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, :message => "Successfully saved note" }
      else
        format.html { redirect_to :action => 'show', :message => 'Error saving note' }
      end
    end
  end
  
  def destroy 
    @note = Note.find(params[:id])
    @note.destroy
    
    redirect_to # show.html.erb
  end
  
end
