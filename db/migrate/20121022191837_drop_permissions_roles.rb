class DropPermissionsRoles < ActiveRecord::Migration
  def change
    drop_table :permissions
    drop_table :roles
    drop_table :role_has_permissions
  end
end
