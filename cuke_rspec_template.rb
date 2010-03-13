# gratuitously lifted from @topfunky's Cucumber PeepCode cast
# Description: Create a starter Cucumber application with restful-authentication.
# Author: Geoffrey Grosenbach http://peepcode.com
# Created: January 20, 2010
# License: MIT

# Gems need to be installed here because of a cucumber dependency that
# "rake gems:install" doesn't handle correctly.
gems_to_install = ['cucumber',
  'cucumber-rails',
  'nokogiri',
  'webrat',
  'rspec',
  'rspec-rails',
  'haml',
  'database_cleaner']
use_sudo = "sudo"
run "#{use_sudo} gem install #{gems_to_install.join(' ')}", :sudo => use_sudo

## Gems

gem 'rspec', :lib => false, :env => "test", :source => "http://gemcutter.org"
gem 'rspec-rails', :lib => false, :env => "test", :source => "http://gemcutter.org"

gem 'cucumber', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"
gem 'cucumber-rails', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"
gem 'database-cleaner', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"
gem 'webrat', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"

## Generators

generate("rspec")
generate("cucumber", "--force", "--webrat", "--rspec")

## Commands

inside("features") do
  run "rm *.feature"
  run "rm step_definitions/ra_*.rb"
  run "rm step_definitions/rest_auth*.rb"
  run "rm step_definitions/user_steps.rb"
end

inside("spec/controllers") do
  run "rm access_control_spec.rb"
  run "rm users_controller_spec.rb"
  run "rm sessions_controller_spec.rb"
end