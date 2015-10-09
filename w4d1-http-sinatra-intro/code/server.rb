require 'sinatra'

get '/' do
  # "Hello <strong>#{params[:username]}</strong>, you're so cool!"

  "<form method='post' action='/login'> \
    Username: <input type='text' name='username' placeholder='your username'>
    <br>
    Password: <input type='password' name='password'>
    <br>
    <input type='submit' value='GOGOGO!!!'>
   </form>
  "
end

get '/about' do
  "Fabio is made of awesome."
end

post '/login' do
  puts params[:username].inspect # => STDOUT
  "OHAI THERE #{params[:username]}"
end
