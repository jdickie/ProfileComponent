# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

 Person.create :first_name => 'James', :last_name => 'Dickie', :middle_name => 'Grant',
    :gender => 'Male', :race => 'White', :nickname => 'Grant' 

  Person.create :first_name => 'Monique', :last_name => 'Everette', :middle_name => 'Q', 
    :gender => 'Female', :race => 'African-American'

  Person.create :first_name => 'Trevor', :last_name => 'Parry-Giles', :middle_name => 'T',
    :gender => 'Male', :race => 'White'

  Person.create :first_name => 'Megan', :last_name => 'Weng', :middle_name => 'Shu', 
    :gender => 'Female', :race => 'Asian'

  Person.create :first_name => 'Christopher', :last_name => 'Perez', :middle_name => 'P',
    :gender => 'Male', :race => 'White'

  Address.create :content => '789 Evergreen Rd', :city => 'Takoma', :state => 'MD',
    :person_id => 1

  Address.create :content => '88 Tipple St', :city => 'Silver Spring', :state => 'MD',
    :person_id => 2

  Address.create :content => '77 Offel St', :city => 'Silver Spring', :state => 'MD',
    :person_id => 3

  Address.create :content => '28 Campus Dr', :city => 'College Park', :state => 'MD',
    :person_id => 3

  Address.create :content => '39 Campus Dr', :city => 'College Park', :state => 'MD',
    :person_id => 4

  Address.create :content => '66 Campus Dr', :city => 'College Park', :state => 'MD',
    :person_id => 5

  Telephone.create :number => 1234567, :person_id => 1

  Telephone.create :number => 1234588, :person_id => 2

  Telephone.create :number => 4456888, :person_id => 3

  Telephone.create :number => 4454568, :person_id => 4
  Telephone.create :number => 4222228, :person_id => 5

  Email.create :uri => 'jdickie@umd.edu', :email_type => 'Work', :person_id => 1

  Email.create :uri => 'meh@umd.edu', :email_type => 'Work', :person_id => 2

  Email.create :uri => 'trevor@umd.edu', :email_type => 'Work', :person_id => 3

  Email.create :uri => 'megan@umd.edu', :email_type => 'Work', :person_id => 4

  Email.create :uri => 'chris@umd.edu', :email_type => 'Work', :person_id => 5

  EmergencyContact.create :first_name => 'Greg', :last_name => 'Dickie', :middle_name => 'Thomas', :relation => 'Father',
    :person_id => 1

  Note.create :title => 'GrantNotePerson', :content => 'This is a note about Grant'
  Note.create :title => 'GrantNoteAddress', :content => 'Note on Grant\'s address'