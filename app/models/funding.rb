class Funding < ActiveRecord::Base
  attr_accessible :institution, :description
  
  has_and_belongs_to_many :calendar_dates
  belongs_to :person
end