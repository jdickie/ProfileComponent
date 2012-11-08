class Permission < ActiveRecord::Base
  attr_accessible :name, :description, :subject_class, :subject_id, :action
  accepts_nested_attributes_for :permissions

  ###################
  # Relationships 
  ###################
  has_and_belongs_to_many :roles
  
  ###################
  # Methods
  ###################
  def to_s 
    "#{name}"
  end
  
end