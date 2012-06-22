# Generating testing framework for Notes model
#
#

class NotesTest < ActiveSupport::TestCase
  
  public
  
    def test_note_valid
      grant = people(:grant)
      # attach ID to grant and make sure its valid
      note = Note.new(:content => 'This is a note about Grant')
      note.people<<grant
      
      assert grant.notes
      assert note.people
      
    end
    
    def test_note_response
    
    end
  
end