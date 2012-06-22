class AddFieldsCalendarDate < ActiveRecord::Migration
  def change
    add_column :calendar_dates, :year, :integer, :limit => 4
    add_column :calendar_dates, :month, :integer, :limit => 2
    add_column :calendar_dates, :day, :integer, :limit => 2
    add_column :calendar_dates, :semester, :string
  end
end
