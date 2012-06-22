class Jointables < ActiveRecord::Migration
  # Creating join tables for notes and other 
  # tables (Addresses, Emergency Contacts, Telephones, Emails)
  #   
  #   Everything should be able to have a note; notes can have records on anything
  def up
    drop_table :people_notes
    
    create_table :notes_people, :id => false do |t|
      t.column :person_id, :integer
      t.column :note_id, :integer
    end
    
    create_table :addresses_notes, :id => false do |t|
      t.column :note_id, :integer
      t.column :address_id, :integer
    end
    
    create_table :notes_telephones, :id => false do |t|
      t.column :note_id, :integer
      t.column :telephone_id, :integer
    end
    
    create_table :emails_notes, :id => false do |t|
      t.column :note_id, :integer
      t.column :email_id, :integer
    end
    
    create_table :emergency_contacts_notes, :id => false do |t|
      t.column :note_id, :integer
      t.column :emergency_contact_id, :integer
    end
    
  end

  def down
  end
end
