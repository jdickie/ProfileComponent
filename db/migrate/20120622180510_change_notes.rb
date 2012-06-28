class ChangeNotes < ActiveRecord::Migration
  def change
    add_column :notes, :title, :string, :default => 'Untitled'
  end
end