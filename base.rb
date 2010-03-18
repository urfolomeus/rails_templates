uses_al = false
uses_cuke = false

## authentication

if yes?("Use authlogic? [y/n]")
  uses_al = true
  load_template "http://github.com/urfolomeus/rails_templates/raw/master/authlogic.rb"
end

## install cucumber and rspec

if yes?("Use cucumber and rspec? [y/n]")
  uses_cuke = true
  load_template "http://github.com/urfolomeus/rails_templates/raw/master/cuke_rspec.rb"
end

## unpack gems

rake("gems:unpack")
rake("gems:unpack", :env => "cucumber") if uses_cuke
rake("rails:freeze:gems")
rake("db:migrate")
rake("db:test:prepare")

## Create test user

#if uses_ra and yes?("Create test user? [y/n]")
#  name = ask("What would like to call the user?")
#  file 'db/seeds.rb',
#  %Q{User.create!(:login => "#{name}", 
#                  :email => "#{name}@example.com", 
#                  :password => "123456", 
#                  :password_confirmation => "123456")}
#  rake "db:seed"
#end

## Files
load_template "http://github.com/urfolomeus/rails_templates/raw/master/files.rb"

## Commands

run "echo TODO > README"
run "rm public/index.html"
run "rm -rf test" if uses_cuke

# jQuery
run "curl -L http://code.jquery.com/jquery-1.4.min.js > public/javascripts/jquery-1.4.min.js"

if yes?("Use git? [y/n]")
  load_template "http://github.com/urfolomeus/rails_templates/raw/master/git.rb"
end