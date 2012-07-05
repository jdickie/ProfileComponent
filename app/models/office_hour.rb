class OfficeHour < ActiveRecord::Base
  attr_accessible :people_id, :calendar_dates_id
  
  # Provides a has_many :through relationship between
  # the people table and calendar_dates. Each record represents
  # a single instance (Semester, year, month, day, start, end times) for 
  # an office appointment
  
  belongs_to :calendar_date
  belongs_to :person
end
