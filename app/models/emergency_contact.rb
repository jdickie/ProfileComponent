class EmergencyContact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :relation,
    :person_id
    
  # All required fields
  validate :first_name, :presence => true
  validate :last_name, :presence => true
  validate :middle_name, :presence => true
  validate :relation, :presence => true
  validate :person_id, :presence => true, :message => "Must have a person_id attached to this record."
  validates_numericality_of :person_id
  
  
  belongs_to :person
  has_and_belongs_to_many :notes
end
