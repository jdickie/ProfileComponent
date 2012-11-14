require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # Assert that controllers throw exception when a non-authorized user
  # tries to do something
  
  # Makes sure notice is thrown and user is redirected
  def test_notice
    assert_equal("You dont have permissions to do that, sorry.", flash[:notice])
    assert_redirected_to :index
  end
  
  test "new throws exception when unauthorized" do
    get(:new, {session[:user_id] => 2})
    test_notice
  end
  
  test "index throws exception when unauthorized" do
    get(:index, {session[:user_id] => 2})
    test_notice
  end
  
  test "create throws exception when unauthorized" do
    get(:create, {session[:user_id] => 2})
    test_notice
  end
  
  test "edit throws exception when unauthorized" do
    get(:edit, {session[:user_id] => 2})
    test_notice
  end
  
  test "destroy throws exception when unauthorized" do
    get(:destroy, {session[:user_id] => 2})
    test_notice
  end
  
  test "edit_permissions throws exception when unauthorized" do
    get(:edit_permissions, {session[:user_id] => 2})
    test_notice
  end
  
  # Assert that authorized user can access what they need
  test "admin user can access new, index, create, edit" do
    get(:new, {session[:user_id] => 1})
    assert_select('form')
  end
end
 