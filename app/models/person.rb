class Person < ActiveRecord::Base
 attr_accessible :first_name, :last_name, :middle_name, :gender, :race, :spouse_name, :person_type, :nickname,
  :date_of_birth, :addresses_attributes, :emails_attributes, :telephones_attributes, :notes_attributes
 
 @VALID_GENDERS = 'Male Female'
 @VALID_GENDERS_HASH = %w(Male Female)
 @VALID_RACES = 'African-American Black Asian Native-American Alaska-Native White Hispanic Latino'
 @VALID_PERSON_TYPES = 'Faculty Staff Graduate-Student Undergraduate-Student Donor'
 
 has_many :emails, :dependent => :destroy
 has_many :addresses, :dependent => :destroy
 has_many :telephones, :dependent => :destroy
 has_many :office_hours, :dependent => :destroy
 has_one :emergency_contact, :dependent => :destroy
 has_and_belongs_to_many :notes
 
 validates :first_name, :presence => true
 validates :last_name, :presence => true
 validates_inclusion_of :gender, :in => @VALID_GENDERS_HASH, :message => "Valid exceptions: " + @VALID_GENDERS
 validates_inclusion_of :race, :in => %w(African-American Black Asian Native American Alaska Native White Hispanic Latino), :message => "Valid exceptions: " + @VALID_RACES
 validates_inclusion_of :person_type, :in => %w(Faculty Staff Graduate-Student Donor), :message => "Valid exceptions for a person's role: " + @VALID_PERSON_TYPES
 
 # allowing nested fields for Address, Emergency_contact, Telephone, Email - reject record from saving if none of the fields are filled in
 accepts_nested_attributes_for :addresses, :emails, :telephones, :emergency_contact, :allow_destroy => true, :reject_if => :all_blank
 # Reject email, address attributes if the type is not set
 accepts_nested_attributes_for :addresses, :reject_if => proc { |attr| attr['address_type'].blank? }
 accepts_nested_attributes_for :emails, :reject_if => proc { |attr| attr['email_type'].blank? }
 accepts_nested_attributes_for :telephones, :reject_if => proc { |attr| attr['telephone_type'].blank? }
 accepts_nested_attributes_for :notes, :allow_destroy => true
 
 def to_s
   "#{first_name} (#{last_name})" 
 end
end



