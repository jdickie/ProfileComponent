# Rakefile for tasks specific to this project

namespace :project do
  prefix = File.dirname(__FILE__)
  
  desc "Run all of the tests within the test/ directory"
  task :startup do
    # make sure db is set up
    sh "rake db:test:prepare"
    sh "rake test:units"
    sh "rails server"
    
  end
end