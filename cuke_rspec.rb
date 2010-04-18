# gratuitously lifted from @topfunky's Cucumber PeepCode cast
# Description: Create a starter Cucumber application with restful-authentication.
# Author: Geoffrey Grosenbach http://peepcode.com
# Created: January 20, 2010
# License: MIT

## Gems

gem 'rspec', :lib => false, :env => "test", :source => "http://gemcutter.org"
gem 'rspec-rails', :lib => false, :env => "test", :source => "http://gemcutter.org"

gem 'cucumber', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"
gem 'cucumber-rails', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"
gem 'database_cleaner', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"
gem 'webrat', :lib => false, :env => "cucumber", :source => "http://gemcutter.org"

## Generators

generate("rspec")
generate("cucumber", "--force", "--webrat", "--rspec")