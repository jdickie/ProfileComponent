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
  
  has_many :roles, :through => :role_has_permissions
  
end
