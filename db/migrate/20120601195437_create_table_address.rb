class CreateTableAddress < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.string :type, :content, :city
      t.string :state, :limit => 2
      t.string :country, :default => 'USA'
      t.references :people
    end
  end

  def down
    drop_table :addresses
  end
end
