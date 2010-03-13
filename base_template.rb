uses_ra = false
uses_cuke = false

## install restful_authentication

if yes?("Use restful-authentication? [y/n]")
  uses_ra = true
  load_template File.join(File.dirname(__FILE__), "tpl_rest_auth.rb")
end

## install cucumber and rspec

if yes?("Use cucumber and rspec? [y/n]")
  uses_cuke = true
  load_template File.join(File.dirname(__FILE__), "tpl_cuke_rspec.rb")
end

## unpack gems

rake("gems:unpack")
rake("gems:unpack", :env => "cucumber") if uses_cuke
rake("rails:freeze:gems")
rake("db:migrate")
rake("db:test:prepare")

## Create test user

if uses_ra and yes?("Create test user? [y/n]")
  #name = ask("What would like to call the user?")
  file 'db/seeds.rb',
  %q{
    User.create!(:login => "krusty", :email => "krusty@example.com", :password => "123456", :password_confirmation => "123456")
  }
  rake "db:seed"
end

## Files
load_template File.join(File.dirname(__FILE__), "tpl_files.rb")

## Commands

run "echo TODO > README"
run "rm public/index.html"
run "rm -rf test" if use_cuke?

# jQuery
run "curl -L http://code.jquery.com/jquery-1.4.min.js > public/javascripts/jquery-1.4.min.js"

if yes?("Use git? [y/n]")
  load_template File.join(File.dirname(__FILE__), "tpl_git.rb")
end