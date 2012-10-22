class Permissions < ActiveRecord::Base
  # not allowing attributes to be accessible 
  # once the system is active 
  #   - these should be permissions un-editable by users
  # 
  # BASE PERMISSIONS:
  #   - Create
  #   - Edit
  #   - Destroy
  #   - View
  
  attr_accessible :name
  
end
