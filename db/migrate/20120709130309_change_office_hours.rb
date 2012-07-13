class ChangeOfficeHours < ActiveRecord::Migration
  def change
    rename_column :calendar_dates, :start_date, :start_time
    rename_column :calendar_dates, :end_date, :end_time
    change_column_default :calendar_dates, :start_time, Time.now
    change_column_default :calendar_dates, :end_time, Time.now
  end
end