require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  fixtures :users
  
  test "user .roles exists" do
    
    assert users(:guest).roles
    assert users(:admin).roles
    assert users(:guest).roles.length == 1
    assert users(:admin).roles.length == 1
  end
  
  test "admin.is? :admin" do 
    assert((users(:admin).is?("admin")), "")
  end
  
  test "get_roles returns correct values" do
    admin_role = users(:admin).get_roles
    assert_equal(admin_role[0], "admin", "User role for admin didn't return 'admin'")
    admin_role.each do |r|
      assert users(:admin).roles.include?(Role.find_by_name(r))
    end
  end
  
  # Create a new user and add roles
  user = User.new({:username => 'newuser', :email => 'nuser@email.com', :password => 'anewuserpass'})
  user.save!
  
  test "user.add_role(One role)" do
    user.add_roles(["admin"])
    assert_equal(user.roles.length, 1, "The user.roles collection did not add anything")
  end
  
  test "user.add_roles(Multiple roles)" do
    user.add_roles(["profile", "profile_editor"])
    assert_equal(user.roles.length, 3, "User roles array updated")
    assert_equal(user.get_roles, ["admin", "profile", "profile_editor"])
  end
  
  # Removing roles from an existing user
  test "user.remove_roles" do
    user.remove_roles(["admin"])
    assert_equal(user.roles.include?(Role.find_by_name("admin")), false)
  end
  
  test "removing multiple roles" do
    # using foobar user to test removing more than one role at a time
    # (User clicks more than one role to remove)
    users(:foo).remove_roles(["profile_viewer", "profile_editor"])
    assert_equal(1, users(:foo).roles.count, "Foobar user still has three roles")
    assert_equal(["profile"], users(:foo).get_roles, "User only has profile role")
  end
end
