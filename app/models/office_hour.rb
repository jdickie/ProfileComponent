class OfficeHour < ActiveRecord::Base
  attr_accessible :person_id, :calendar_date_id
  
  # Provides a has_many :through relationship between
  # the people table and calendar_dates. Each record represents
  # a single instance (Semester, year, month, day, start, end times) for 
  # an office appointment
  
  belongs_to :person
  belongs_to :calendar_date
end
