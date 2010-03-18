gem 'authlogic'
gem 'nifty-generators'

rake 'gems:install', :sudo => true

generate "nifty_layouts"
generate "nifty_authentication"