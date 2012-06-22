class ChangeAddress < ActiveRecord::Migration
  def change
    rename_column :addresses, :people_id, :person_id
  end
end
