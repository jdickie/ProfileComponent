require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "User gets logged in with message" do
    u = users(:guest)
    p = User.authenticate(u.username, 'guest123')
    assert(p, "User.authenticate did not pass")
    post :attempt_login, { :username => u.username, :password => 'guest123'}
    test_notice('You have successfully logged in')
  end
end
