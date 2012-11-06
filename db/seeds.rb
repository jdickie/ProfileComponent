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
  :password => 'Jupit3r',
  :roles_mask => 2
},{
  :username => "guest",
  :email => 'user@nowhere.com',
  :password => 'V3nus',
  :roles_mask => 1
},{
  :username => "superadmin",
  :email => 'guest@nowhere.com',
  :password => 'M3rcury',
  :roles_mask => 3
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