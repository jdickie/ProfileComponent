class ChangeTimeRecordToCalendarDate < ActiveRecord::Migration
  def change 
    rename_table :time_records, :calendar_dates
  end
end
