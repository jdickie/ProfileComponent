class RemoveAdminTables < ActiveRecord::Migration
  def up
    drop_table :admins
    
  end
  
  def down 
    create_table(:admins) do |t|
      t.string   "username"
      t.string   "hashed_password"
      t.string   "salt"
      t.string   "email"
      t.datetime "created_at",      :null => false
      t.datetime "updated_at",      :null => false
    end
  end
end
