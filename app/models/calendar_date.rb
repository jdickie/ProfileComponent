class CalendarDate < ActiveRecord::Base
  attr_accessible :year, :month, :day, :semester, :start_time, :end_time, :fundings_id
  
  validates_numericality_of :year, :month, :day
  
  validates_inclusion_of :semester, :inclusion, :in => %( Fall, Spring, Winter, Summer1, Summer2 ), 
          :message => "Must be either Fall, Spring, Winter, Summer1 or Summer2"
  
  has_one :office_hour
  
  has_and_belongs_to_many :fundings
end