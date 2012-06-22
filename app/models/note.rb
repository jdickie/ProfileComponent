class Note < ActiveRecord::Base
  attr_accessible :type, :content, :title
  
  validate :title, :presence => true
  validate :content, :presence => true
  
  has_and_belongs_to_many :emails
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :telephones
  has_and_belongs_to_many :emergency_contacts
  has_and_belongs_to_many :fundings
  has_and_belongs_to_many :people
  
  accepts_nested_attributes_for :people, :emails, :addresses, :telephones, :emergency_contacts, :fundings
end