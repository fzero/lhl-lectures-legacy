helpers do

  # Get logged-in user or redirects to login page
  # Uses session[:login_error] to store an error message when needed
  def check_user
    @user = User.find_by(id: session[:user_id])
    if @user
      session.delete(:login_error)
    else
      session[:login_error] = "You must be logged in."
      redirect '/login'
    end
  end

  # Gets tune from params[:id] or redirects to tune list
  def get_tune
    @tune = Tune.find_by(id: params[:id])
    redirect '/tunes' unless @tune
  end

end


# Home
get '/' do
  check_user
  redirect '/tunes'
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
  # request.xhr? returns true when the request comes from Javascript...
  if request.xhr?
    # ...and in that case we return JSON
    @user.tunes.to_json
  else
    # If it's regular request, proceed as usual and render HTML
    erb :'tunes/index'
  end
end

get '/tunes.json' do
  check_user
  @user.tunes.to_json
end


# Same as tunes, but using Javascript/AJAX to fetch JSON data from
# /tunes - see /app/views/tunes/index_js.erb
get '/tunes_js' do
  check_user
  erb :'tunes/index_js'
end



# Display a form to add a new tune
get '/tunes/new' do
  check_user
  @tune = @user.tunes.new
  erb :'tunes/new'
end


# Display a form to edit an existing tune
get '/tunes/:id/edit' do
  check_user
  get_tune
  redirect '/tunes/new' unless @tune
  erb :'tunes/edit'
end


# Show a tune
# R in CRUD
get '/tunes/:id' do
  check_user
  get_tune
  erb :'tunes/show'
end


# Create a tune
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
# U in CRUD
put '/tunes' do
  check_user
  get_tune
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


# Alternative route to update
post '/tunes/:id/update' do
  check_user
  get_tune
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
# D in CRUD
delete '/tunes' do
  check_user
  get_tune
  @tune.destroy
  redirect '/tunes'
end


# Alternative route to delete a tune
# Dangerous, I know.
get '/tunes/:id/delete' do
  check_user
  get_tune
  @tune.destroy
  redirect '/tunes'
end


# Use this endpoint to test POSTing data from Javascript.
# Every key in a JSON object will show up as a param key.
#
# JS -> {chocolate: 'Lindt salt caramel'}
# Sinatra -> params[:chocolate] = 'Lindt salt caramel'
#
# If you want to send more complex data (like an array containing objects),
# it might be better to use JSON.stringify on the client and parse it on
# the server with JSON.parse. Example JS client code:
#
# var mydata = [{name: 'Fabio', city: 'Toronto'}, {name: 'Don', city: 'Vancouver'}];
# var postdata = {data: JSON.stringify(mydata)};
# $.post('/jsontest', postdata);
#
# Open the terminal where your server is running to see the results!
post '/jsontest' do
  puts "---------------------------------------"
  puts params
  puts JSON.parse(params[:data]) if params[:data]
  puts "---------------------------------------"
end
