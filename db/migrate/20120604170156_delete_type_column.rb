class DeleteTypeColumn < ActiveRecord::Migration
  def change
    rename_column :people, :type, :person_type
    rename_column :addresses, :type, :address_type
    rename_column :emails, :type, :email_type
    rename_column :telephones, :type, :telephone_type
  end
end
