class Telephone < ActiveRecord::Base
  attr_accessible :type, :number, :person_id, :telephone_type
  
  belongs_to :person
  has_and_belongs_to_many :notes
end