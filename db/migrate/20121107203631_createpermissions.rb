class Createpermissions < ActiveRecord::Migration
  def change
    # Creating has-and-belongs-to-many join tables between 
    # users and roles, roles and permissions
    create_table :users_roles, :id => false do |t|
      t.integer :user_id
      t.integer :role_id
    end
    
    create_table :roles_permissions, :id => false do |t|
      t.integer :role_id
      t.integer :permission_id
    end
    
    # getting rid of user role_id column
    remove_column :users, :role_id
    
  end
end
