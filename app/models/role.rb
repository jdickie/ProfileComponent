class Role < ActiveRecord::Base
  attr_accessible :name, :description
  
  ###################
  # Relationships 
  ###################
  has_and_belongs_to_many :users 
  has_and_belongs_to_many :permissions
  
  ###################
  # Methods
  ###################
  def self.has_permissions?(permissions=[])
    if self.permissions.empty? 
      return false
    end
    
    permissions.each do |p|
      self.permissions.include?(p)
    end
  end
  
  
  
end
