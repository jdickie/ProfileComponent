class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.references :permission
      t.timestamps
    end
    
    ### Also changing users table and creating
    ### a permissions table
    remove_column :users, :roles_mask
    remove_column :users, :role
    add_column :users, :role_id, :integer, :default => 1
    
    create_table :permissions do |t|
      t.string :action, :subject_class, :name
      t.integer :subject_id
      
      t.timestamps
    end
  end
end
