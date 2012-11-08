class AlterRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :permission_id
  end
end
