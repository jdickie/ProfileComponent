class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :type, :uri
      t.references :users
      t.timestamps
    end
  end
end
