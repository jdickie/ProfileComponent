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
  def has_permissions?(p_array=[])
    if self.permissions.empty? 
      return false
    end
    
    p_array.each do |p|
      if (p.is_a?(String))
        p = Permission.find_by_name(p)
      end
      self.permissions.include?(p)
    end
  end
  
  # Adding an array of permission names (Strings)
  def add_permissions(p_array=[])
    if p_array.empty?
      return false
    end
    
    p_array.each do |p|
      if (p.is_a?(String))
        p = Permission.find_by_name(p)
      end
      self.permissions<<p
    end
  end
  
end
