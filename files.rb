## Generate welcome page

generate :controller, "welcome index"
route "map.root :controller => 'welcome'"

## Generate flashes and layout file

file 'app/views/layouts/_flashes.html.erb', 
%q{<div id="flash">
  <% flash.each do |key, value| -%>
    <div class="<%= key %>"><%=h value %></div>
  <% end -%>
</div>
}

file 'app/views/layouts/application.html.erb', 
%q{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>Application</title>
    <%= stylesheet_link_tag 'application', :media => 'all', :cache => true %>
    <%= javascript_include_tag 'jquery-1.4.min', 'application', :cache => true %>
  </head>
  <body>
    <%= render :partial => 'layouts/flashes' -%>
    <div class="container">
      <p>Sample layout in effect - fill me in!</p>
      <%= yield %>
    </div>
  </body>
</html>
}

## Generate javascript files

run "rm public/javascripts/*.js"
file 'public/javascripts/application.js',
%q|jQuery(function () {
  
});
|