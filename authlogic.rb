if yes?("Install gem? [y/n]")
  gem authlogic
  rake "gems:install"
end

user_fields = [ "username:string", 
                "email:string", 
                "crypted_password:string",
                "password_salt:string",
                "persistence_token:string"]
user_controller_actions = ["new", "edit"]

generate "nifty_scaffold user #{user_fields.join(' ')} #{user_controller_actions.join(' ')}"

file 'app/models/user.rb', 
%q{class User < ActiveRecord::Base
  acts_as_authentic
end
}

file 'app/views/users/_form.html.erb', 
%q{<% form_for @user do |f| %>
  <%= f.error_messages %>
  <p>
    <%= f.label :username %><br />
    <%= f.text_field :username %>
  </p>
  <p>
    <%= f.label :email %><br />
    <%= f.text_field :email %>
  </p>
  <p>
    <%= f.label :password %><br />
    <%= f.password_field :password %>
  </p>
  <p>
    <%= f.label :password_confirmation %><br />
    <%= f.password_field :password_confirmation %>
  </p>
  <p><%= f.submit "Submit" %></p>
<% end %>
}