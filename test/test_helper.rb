ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # Makes sure notice is thrown and user is redirected
  def test_notice(notice)
    assert_equal(notice, flash[:notice])
    assert_redirected_to :index
  end
  
  module GetAccess
    def access_fail(path, notice)
      get(path)
      assert_response :error
      test_notice(notice)
    end
    
    def access_success(path, notice)
      get(path)
      assert_response :success
      test_notice(notice)
    end
  end
      
  # Login in a user and make sure they are redirected
  def login(user, password)
    # start a session and log a user in
    u = users(user)
    session[:user_id] = u.id
    session[:username] = u.username
  end
end
