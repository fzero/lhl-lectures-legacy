def check_login
  @user = User.find_by(id: session[:user_id])
  unless @user
    session[:login_error] = "You must be logged in"
    redirect '/login'
  end
end

# Home
get '/' do
  erb :index
end

# List cookies
get '/cookies' do
  # Here we set two cookies. They will still show up in the cookies List
  # if we comment out the lines below after going to this action.
  cookies[:cookie1] = "Chocolate chip"
  cookies[:cookie2] = "Oreo"
  erb :cookies
end

# List sessions
get '/sessions' do
  # Here we set two sessions. They will still show up in the sessions List
  # if we comment out the lines below after going to this action.
  session[:secret1] = "This is a secret session variable!"
  session[:secret2] = "And this is another one"
  erb :sessions
end

# Login
get '/login' do
  erb :login
end

# Login validation
# Note this action doesn't render anything - just redirects to
# two other actions depending on a successful login.
post '/validate' do
  email = params[:email]
  password = params[:password]
  # We're using has_secure_password on User, so we'll check the password using
  # User#authenticate. Now, because we can get a wrong email too, we can have
  # a situation where User.find_by(email ...) will return nil, blowing up
  # on authenticate. To avoid that we'll use the .try() method, which
  # automatically stops if we get a nil from User#find_by.
  user = User.find_by(email: email).try(:authenticate, password)
  if user
    session.delete(:login_error) # Login successful, delete login error message
    session[:user_id] = user.id
    redirect '/tunes'
  else
    session.delete(:user_id) # Just to make sure we're logged out
    session[:login_error] = "You must be logged in."
    redirect '/login'
  end
end

# Logout
get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

# Tunes for the current user
get '/tunes' do
  # get user from session
  check_login
  erb :tunes
end

get '/tunes/:id' do
  check_login
  @tune = @user.tunes.find_by(id: params[:id])
  erb :tune
end
