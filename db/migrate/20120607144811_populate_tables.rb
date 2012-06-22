class PopulateTables < ActiveRecord::Migration
  # have to change column names first
  def change
    rename_column :telephones, :people_id, :person_id
  end
  
  
end
