require FILE.dirname(__FILE__) + '/../test_helper'

class EmailTest < ActiveSupport::TestCase
  def test_email_present do
    email = emails(:email_grant_work)
    
    assert email.uri
    assert email.email_type
    assert email.person_id
    
    grant = people(:grant)
    
    assert grant.emails
    
  end
  
  def test_validation do
  end
  
end
