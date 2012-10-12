class DashboardController < ActionController::Base
  protect_from_forgery
  
  before_filter :confirm_logged_in
  
end