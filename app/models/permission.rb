class Permission < ActiveRecord::Base
  attr_accessible :name, :description, :subject_class, :subject_id, :action

end