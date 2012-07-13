class OfficeHoursCorrectFks < ActiveRecord::Migration
  def change
    rename_column :office_hours, :people_id, :person_id
    rename_column :office_hours, :calendar_dates_id, :calendar_date_id
  end
end
