app_name = @root.split('/').last
uses_cuke = false

## gems
if yes?("Install gems? [y/n]")
  gems_to_install = [
    'cucumber',
    'cucumber-rails',
    'nokogiri',
    'webrat',
    'rspec',
    'rspec-rails',
    'haml',
    'database_cleaner',
    'nifty-generators',
    'authlogic',
    'tiny_mce'
  ]
  run "gem install #{gems_to_install.join(' ')}", :sudo => true
end

## authentication

if yes?("Use authlogic? [y/n]")
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

## Files
load_template "http://github.com/urfolomeus/rails_templates/raw/master/files.rb"

## Commands

run "echo TODO > README"
run "rm public/index.html"
run "rm -rf test" if uses_cuke

# jQuery
run "curl -L http://code.jquery.com/jquery-1.4.min.js > public/javascripts/jquery-1.4.min.js"

if yes?("Use HAML? [y/n]")
  run "haml --rails #{app_name}"
end

if yes?("Use TinyMCE? [y/n]")
  gem 'tiny_mce', :lib => false
end

if yes?("Use RStakeout? [y/n]")
  run "cp ./rstakeout #{@root}/script/rstakeout"
  run "chmod +x #{@root}/script/rstakeout"
end

if yes?("Use git? [y/n]")
  load_template "http://github.com/urfolomeus/rails_templates/raw/master/git.rb"
end