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
      t.references :roles
      t.references :permissions
      t.timestamps
    end
  end
end
