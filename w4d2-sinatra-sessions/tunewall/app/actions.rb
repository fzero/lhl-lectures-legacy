# Home
get '/' do
  erb :index
end

# List cookies
get '/cookies' do
  # Let's create some cookies!
  erb :cookies
end

# List sessions
get '/sessions' do
  # Let's create some sessions, I guess.
  erb :sessions
end

# Login form
get '/login' do
  erb :login
end

# Login validation
# Note this action doesn't render anything - just redirects to
# two other actions depending on a successful login.
post '/validate' do
  # Check user credentials here
end

# Logout
get '/logout' do
  # Log out user here
  redirect '/login'
end

# Tunes for the current user
get '/tunes' do
  @tunes = Tune.all
  erb :tunes
end
