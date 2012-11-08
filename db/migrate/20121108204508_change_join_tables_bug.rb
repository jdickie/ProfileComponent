class ChangeJoinTablesBug < ActiveRecord::Migration
  def change
    # Mistakenly misnamed the join tables for Users, Roles, Permissions 
    # belongs_to_and_has_many relationship tables. Needs to be set such
    # that the tables go in alphabetical order (e.g. apple_banana, banana_carrot)
    rename_table :users_roles, :roles_users
    rename_table :roles_permissions, :permissions_roles
  end
end
