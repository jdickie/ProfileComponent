class CreateTelephoneNotes < ActiveRecord::Migration
  def up
    create_table :telephones do |t|
      t.string :type, :limit => 5
      t.integer :number
      t.references :people
      
      t.timestamps
    end
      
    create_table :notes do |t|
      t.string :type
      t.text :content
      t.references :timerecords
      
      t.timestamps
    end
    
    # Also creating a Time Record table to track times
    create_table :time_records do |t|
      t.date  :start_date
      t.date  :end_date
    end
  end

  def down
    drop_table :telephones
    drop_table :notes
    drop_table :time_records
  end
end
