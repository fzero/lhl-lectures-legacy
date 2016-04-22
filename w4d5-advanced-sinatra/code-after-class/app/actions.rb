helpers do
  # Helper methods go here
end

before do
  # Stuff that happens before ALL actions go here.
  # If you want to be specific, make a block with a route
  # matcher. This is pretty good place control sessions.
  #
  # Example:
  #
  # before '/protected/*'
  #   check_login
  # end
end

after do
  # Same idea as `before`, but happening AFTER actions.
  # Potentially less useful, but hey, it's there.
end

# Homepage (Root path)
get '/' do
  erb :index
end

# TODO
get '/login' do
  erb :login
end

# TODO
post '/signin' do
end

get '/puppies' do
  @puppies = Puppy.all
  if request.xhr? # Is it javascript?
    @puppies.to_json
  else
    erb :'puppies/index'
  end
end

get '/puppies.json' do
  @puppies = Puppy.all
  @puppies.to_json
end

get '/puppies/new' do
  @puppy = Puppy.new
  erb :'puppies/new'
end

# This endpoint receives the AJAX call to update the cuteness_level
# Each key on the JSON object send by the JS code becomes a param
post '/puppies/increase_cuteness' do
  @puppy = Puppy.find_by(id: params[:id])
  if @puppy
    @puppy.cuteness_level = params[:cuteness_level]
    @puppy.save
  end
  {status: 'ok'}.to_json
end

get '/puppies/:id' do
  @puppy = Puppy.find_by(id: params[:id])
  if !@puppy
    redirect '/puppies'
  end
  erb :'puppies/show'
end

get '/puppies/:id/edit' do
end

post '/puppies' do
end

put '/puppies/:id' do
end

delete '/puppies/:id' do
end

