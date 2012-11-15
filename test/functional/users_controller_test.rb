require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # Assert that controllers throw exception when a non-authorized user
  # tries to do something
  
  # test "Throws exception when user fails to have priviledges" do
  #     guest = login(:guest, "guest123")
  #     
  #     guest.access_fail('users/edit/1', 'You dont have permissions to do that, sorry.')
  #   end
  #   
  #   # Assert that authorized user can access what they need
  #   test "admin user can access new, index, create, edit" do
  #     get(:new, {session[:user_id] => 1})
  #     assert_select('form')
  #   end
end
 