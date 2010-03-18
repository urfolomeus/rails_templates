if yes?("Install gem? [y/n]")
  gem authlogic
  rake "gems:install"
end

generate nifty_scaffold user username:string email:string password:string new edit