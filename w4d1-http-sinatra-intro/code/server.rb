# Minimalistic sinatra example - http://www.sinatrarb.com
# Install the sinatra gem with `gem install sinatra` then run this file with `ruby server.rb`
# The server will run at http://localhost:4567 by default

require 'sinatra'

get '/' do
  # `puts` don't show up in the browser; you can use it for logging
  puts "Going to / worked!"

  # Query parameters (?foo=bar&fizz=buzz) show up in the params[] array.
  # When a param isn't present, nil is returned.
  # We're taking advantage of this below to define default values.
  time_of_day = params[:time_of_day] || 'morning'
  name = params[:name] || 'stranger'

  # The last thing returned by the method will be displayed in the browser.
  "Good #{params[:time_of_day]} #{params[:name]}!"
end


get '/signin' do
  # Just returning the HTML for a simple form.
  # Pressing the GOGOGO!!! button will POST the data to `/login`.
  "<form method='post' action='/login'> \
    Username: <input type='text' name='username' placeholder='your username'>
    <br>
    Password: <input type='password' name='password'>
    <br>
    <input type='submit' value='GOGOGO!!!'>
   </form>
  "
end

post '/login' do
  # POSTed form fields will also show up inside params[]
  "You logged in with username #{params[:username]} and password #{params[:password]}."
end
