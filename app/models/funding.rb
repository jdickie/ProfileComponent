class Funding < ActiveRecord::Base
  attr_accessible :institution, :description, :person_id
  
  has_and_belongs_to_many :calendar_dates
  belongs_to :person
  accepts_nested_attributes_for :person, :allow_destroy => true
end