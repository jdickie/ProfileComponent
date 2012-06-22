class Address < ActiveRecord::Base
  attr_accessible :city, :state, :country, :content, :person_id, :zip_code, :address_type
  
  belongs_to :person
  has_and_belongs_to_many :notes
end