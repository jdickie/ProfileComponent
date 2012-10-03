class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      
      t.timestamps
    end
    
    create_table :permissions do |t|
      t.string :name
      
      t.timestamps
    end
    
    create_table :role_has_permissions do |t|
      t.integer :role_id
      t.integer :permission_id
      t.timestamps
    end
  end
end
