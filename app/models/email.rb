class Email < ActiveRecord::Base
  attr_accessible :uri, :person_id, :email_type
  
  validates_format_of :uri, :with =>
    /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i 
  
  belongs_to :person
end
