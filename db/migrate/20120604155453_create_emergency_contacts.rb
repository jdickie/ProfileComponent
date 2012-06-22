class CreateEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :emergency_contacts do |t|
      t.string :first_name, :last_name, :middle_name
      t.string :relation
      t.references :people
      
      t.timestamps
    end
  end
end
