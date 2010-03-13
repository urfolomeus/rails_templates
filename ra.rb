## Plugins

plugin "restful-authentication", :git => "git://github.com/technoweenie/restful-authentication.git"

## Generators

generate(:authenticated, "user sessions", "--rspec")

## Files

file 'app/controllers/application_controller.rb', 
%q{class ApplicationController < ActionController::Base
 
  helper :all
 
  protect_from_forgery

  include AuthenticatedSystem

  filter_parameter_logging :password
 
end
}

