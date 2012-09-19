class Admin < ActiveRecord::Base
  # Protecting the hashed_password and salt attributes
  attr_accessible :username, :email
  
  
end
