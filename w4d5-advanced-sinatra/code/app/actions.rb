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
