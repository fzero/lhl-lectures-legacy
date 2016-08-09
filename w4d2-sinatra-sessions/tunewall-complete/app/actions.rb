helpers do

  def check_user
    @user = User.find_by(id: session[:user_id])
    if @user
      session.delete(:login_error)
    else
      session[:login_error] = "You must be logged in."
      redirect '/login'
    end
  end

end

# Home
get '/' do
  erb :index
end

# List cookies
get '/cookies' do
  cookies[:cookie1] = "Chocolate chip"
  cookies[:cookie2] = "Oreo"
  erb :cookies
end

# List sessions
get '/sessions' do
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
  user = User.find_by(email: email).try(:authenticate, password)
  if user
    session[:user_id] = user.id
    redirect '/tunes'
  else
    session.delete(:user_id)
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
  check_user
  erb :tunes
end
