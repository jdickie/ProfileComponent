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
  :password => 'Jupit3rPlan3t',
  
},{
  :username => "guest",
  :email => 'user@nowhere.com',
  :password => 'V3nusPlan3t',
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

Permission.create([
  {
    :action => 'assign_roles',
    :subject_class => 'User',
    :name => "Assign roles to users",
    :subject_id => nil
  },
  {
    :action => 'create',
    :subject_class => 'User',
    :name => "Create users",
    :subject_id => nil
  },
  {
    :action => 'edit_own',
    :subject_class => 'User',
    :name => "Edit users",
    :subject_id => nil
  },
  {
    :action => 'edit_all',
    :subject_class => 'User',
    :name => "Edit ALL users",
    :subject_id => nil
  },
  {
    :action => 'destroy',
    :subject_class => 'User',
    :name => "Delete users",
    :subject_id => nil
  },
  {
    :action => 'view_own',
    :subject_class => 'User',
    :name => "View own user profile",
    :subject_id => nil
  },
  {
    :action => 'view_all',
    :subject_class => 'User',
    :name => "View ALL user profiles",
    :subject_id => nil
  },
  {
    :action => 'create',
    :subject_class => 'Taxonomy',
    :name => "Create taxonomy terms",
    :subject_id => nil
  },
  {
    :action => 'edit',
    :subject_class => 'Taxonomy',
    :name => "Edit taxonomy terms",
    :subject_id => nil
  },
  {
    :action => 'destroy',
    :subject_class => 'Taxonomy',
    :name => "Delete taxonomy terms",
    :subject_id => nil
  },
  {
    :action => 'read',
    :subject_class => 'Taxonomy',
    :name => "View taxonomy terms",
    :subject_id => nil
  }])
  
  
  
Role.create([{
  :name => 'guest',
  :description => "Guest account",
},
{
  :name => 'profile',
  :description => 'Base user role',
},
{
  :name => 'profile_viewer',
  :description => "Can view all user profiles",
},
{
  :name => 'profile_editor',
  :description => "View and edit ALL user profiles",
},
{
  :name => 'admin',
  :description => "All permissions"
}
])


# Connecting the Users to their roles
UsersRoles.create([{
  :user_id => 1,
  :role_id => 4
}])

RolesPermissions.create([{
  :role_id => 4
}])