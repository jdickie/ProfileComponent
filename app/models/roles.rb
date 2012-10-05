class Roles < ActiveRecord::Base
  # Users can define role names
  # and which users have these roles attached
  # to them.
  
  attr_accessible :name
  
  has_many :users
  has_many :permissions, :through => :role_has_permission
end
