class CreatePeopleNotes < ActiveRecord::Migration
  def change
    create_table :people_notes do |t|
      t.column :people_id, :integer
      t.column :notes_id, :integer
    end
  end
end
