class RoleHasPermission < ActiveRecord::Base
  # Connects the role to it's permissions
  #
  # One record in this table represents one permission - role join
  # Has an ID so that each join can be destroyed.
  validates_presence_of :role_id
  validates_presence_of :permission_id
  
end
