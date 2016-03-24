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
  user = User.find_by(email: email, password: password)
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
# index action for resource tunes
# R in CRUD
get '/tunes' do
  check_user
  erb :'tunes/index'
end

# Display the form to add a new tune
get '/tunes/new' do
  check_user
  @tune = @user.tunes.new
  erb :'tunes/new'
end

# Display a fomr to edit an existing tune
get '/tunes/:id/edit' do
  check_user
  @tune = Tune.find_by(id: params[:id])
  redirect '/tunes/new' unless @tune
  erb :'tunes/edit'
end

# show action for tunes
# R in CRUD
get '/tunes/:id' do
end

# create action for tunes
# C in CRUD
post '/tunes' do
  check_user
  @tune = @user.tunes.create(
    artist: params[:artist],
    title: params[:title],
    url: params[:url],
    comments: params[:comments]
  )
  if @tune.id
    redirect '/tunes'
  else
    redirect '/tunes/new'
  end
end

# Update a tune
put '/tunes' do
  check_user
  @tune = Tune.find_by(id: params[:id])
  @tune.artist = params[:artist]
  @tune.title = params[:title]
  @tune.url = params[:url]
  @tune.comments = params[:comments]
  if @tune.save
    redirect '/tunes'
  else
    redirect "/tunes/#{params[:id]}/edit"
  end
end

# Delete a tune
delete '/tunes' do
end

