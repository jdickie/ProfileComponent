class SetDefaults < ActiveRecord::Migration
  def change
    change_column_default(:emails, :email_type, 'Work')
    change_column_default(:addresses, :address_type, 'Work')
    change_column_default(:telephones, :telephone_type, 'Work')
    change_column_default(:people, :person_type, 'Faculty')
  end
end
