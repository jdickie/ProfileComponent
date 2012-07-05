class OfficeTable < ActiveRecord::Migration
  def change
    create_table :office_hours do |t|
      t.references :people
      t.references :calendar_dates
    end
  end
end