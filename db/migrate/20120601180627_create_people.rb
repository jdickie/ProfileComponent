class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, :last_name, :middle_name, :gender, :race, :spouse_name
      t.date  :date_of_birth
      
      t.timestamps
    end
  end
end
