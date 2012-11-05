# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create([{
  :username => "admin",
  :email => 'admin@nowhere.com',
  :password => 'VO1VODb0x9',
  :roles_mask => 2
},{
  :username => "regular_user",
  :email => 'user@nowhere.com',
  :password => 'moxbrm12',
  :roles_mask => 1
}])

Taxonomy.create([{
  :name => "Important",
  :description => "Something important"
},
{
  :name => "Not Important",
  :description => "Something not important"
},
{
  :name => "Urgent",
  :description => "Needs to get done this week"
},
{
  :name => "Critical",
  :description => "Needs to get done ASAP"
}])