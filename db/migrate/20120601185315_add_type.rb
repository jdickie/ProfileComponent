class AddType < ActiveRecord::Migration
  def change
    add_column :people, :type, :string
  end
end
