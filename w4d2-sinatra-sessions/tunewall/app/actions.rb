helpers do

  def check_user
    session.delete(:login_error)
    @user = User.find_by(id: session[:user_id])
    unless @user
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
post '/validate' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email, password: password)
  if user
    session[:user_id] = user.id
    redirect '/tunes'
  else
    session.delete(:user_id)
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
  check_user # If logged in, I'll have @user ready to go.
  erb :tunes
end

