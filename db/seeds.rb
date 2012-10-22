# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

admin = User.create({
  :username => "admin",
  :email => 'admin@nowhere.com',
  :password => 'VO1VODb0x9',
  :roles_mask => 1
})