require File.dirname(__FILE__) + '/../test_helper'
require 'person'

# Person class tests
# 
# These tests cover usage cases for the Person class (Table: people). Things
# covered here are when the user makes a mistake and an error has to be thrown (negative tests)
# and making sure that a user can properly save a record (positive tests). Fixtures are used
# from emails, emergency contacts, telephones, addresses, and notes as well as person.yaml. These
# are located in the ./test/fixtures/ directory.

class PersonTest < ActiveSupport::TestCase
  # test contraints for Person class
  protected
    def test_for_db_error(error_message, &block)
      begin
        yield
      rescue ActiveRecord::StatementInvalid
        database_threw_error = true
      rescue ActiveRecord::RecordInvalid
        database_threw_error = true
      rescue
        something_else_threw_error = true
      end
      assert !something_else_threw_error, "There is an error in our test code"
      assert database_threw_error && !something_else_threw_error, error_message
    end
  
  public
  def test_no_name 
    person = Person.new(:first_name => 'Grant', :middle_name => '')
    test_for_db_error("Database didn't catch null error for first and middle names") do
      person.save!
    end 
  end
  
  # Testing records from the YAML fixtures in ../fixtures/people.yml
  def test_yaml_records
    grant = people(:grant)
    assert people(:grant).first_name?
    assert grant.last_name?
    assert grant.middle_name?
    assert grant.race?
    assert grant.gender?
    assert grant.date_of_birth?
    assert_equal "White", grant.race
    assert_equal "Male", grant.gender
  end
  
  def test_presence_validation 
    person = Person.new(:first_name => 'James', :middle_name => 'Grant', :race => 'Caucasian', :gender => 'Male')
    test_for_db_error("Database didn't catch null last_name exception") do
      person.save!
    end
  end
  
  def test_race_validation 
    person = Person.new(:first_name => 'James', :last_name => 'Dickie', :middle_name => 'Grant', :race => 'casian', :gender => 'Male')
    test_for_db_error("Database didn't catch invalid race type") do
      person.save!
    end
  end
  
  def test_gender_validation 
    person = Person.new(:first_name => 'James', :last_name => 'Dickie', :middle_name => 'Grant', :race => 'Caucasian', :gender => 'Dwarf')
    test_for_db_error("Database didn't catch invalid race type") do
      person.save!
    end
  end
  
  # Checking referential integrity
  #
  # checking using megan and grant records from the people.yaml in ../fixtures
  def test_emails_join 
    
    grant = people(:grant)
    megan = people(:megan)
    email_grant_work = emails(:email_grant_work)
    email_grant_work2 = emails(:email_grant_work2)
    email_megan_work = emails(:email_megan_work)
    
    # Do the emails register inside grand and megan records?
    assert_equal grant.id, email_grant_work.person_id
    assert_equal megan.id, email_megan_work.person_id
    assert_equal grant.id, email_grant_work2.person_id
    assert_equal grant.emails.count, 2
    
    
  end
  
  def test_addresses_join
    grant = people(:grant)
    megan = people(:megan)
    grant_address = addresses(:grant_address)
    megan_address1 = addresses(:megan_address)
    megan_address2 = addresses(:megan_address_2)
    
    assert megan.addresses
    assert grant.addresses
    assert_equal grant.id, grant_address.person_id
    assert_equal megan.id, megan_address1.person_id
    assert_equal megan.id, megan_address2.person_id
    grant.addresses.each do |a|
      assert a.content
      assert a.person_id
    end
  end
  
  def test_telephone_join
    grant = people(:grant)
    megan = people(:megan)
    grant_phone = telephones(:grant_phone)
    megan_phone1 = telephones(:megan_phone)
    megan_phone2 = telephones(:megan_phone_2)
    
    assert megan.telephones
    assert grant.telephones
    assert_equal grant.id, grant_phone.person_id
    assert_equal megan.id, megan_phone1.person_id
    assert_equal megan.id, megan_phone2.person_id
    megan.telephones.each do |t|
      assert t.number
      assert t.person_id
    end
  end
  
  def test_emergency_contact_join
    grant = people(:grant)
    grant_contact = emergency_contacts(:grant_emergency_contact)
    
    assert grant.emergency_contact
    
    assert_equal grant.id, grant.emergency_contact.person_id
    
  end
  
  def test_update
    grant = people(:grant)
    grant_address = addresses(:grant_address)
    grant_phone = telephones(:grant_phone)
    grant_email = emails(:email_grant_work)
    grant_email2 = emails(:email_grant_work2)
    grant_contact = emergency_contacts(:grant_emergency_contact)
    
    grant_address.content = "78 Wayford Way"
    grant_address.save!
    assert_equal grant.addresses.first.content, grant_address.content
    
    
  end
  
  def test_delete
    grant = people(:grant)
    grant_address = addresses(:grant_address)
    grant_phone = telephones(:grant_phone)
    grant_email = emails(:email_grant_work)
    grant_email2 = emails(:email_grant_work2)
    grant_contact = emergency_contacts(:grant_emergency_contact)
    
    grant_address.destroy
    grant_phone.destroy
    
    grant.addresses.each do |a|
      assert_nil a
    end
    
    grant.telephones.each do |a|
      assert_nil a
    end
    
    megan = people(:megan)
    megan_address = addresses(:megan_address)
    megan_address2 = addresses(:megan_address_2)
    megan_phone = telephones(:megan_phone)
    megan_phone2 = telephones(:megan_phone_2)
    megan_email = emails(:email_megan_work)
    megan_contact = emergency_contacts(:megan_emergency_contact)
    
    megan.destroy!
    assert_nil megan_address
    assert_nil megan_address2
    assert_nil megan_phone
    assert_nil megan_phone2
    assert_nil megan_email
    assert_nil megan_contact
    
  end
end
