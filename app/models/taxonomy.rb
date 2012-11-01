class Taxonomy < ActiveRecord::Base
  attr_accessible :name, :description
  
  def to_s
    ""
  end
end
