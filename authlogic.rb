if yes?("Install gems? [y/n]")
  gems_to_install = ['authlogic', 'nifty-generators']
  run "sudo gem install #{gems_to_install.join(' ')}", :sudo => true
end

generate "nifty_layouts"
generate "nifty_authentication"