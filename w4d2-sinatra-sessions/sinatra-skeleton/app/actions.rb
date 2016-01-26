# Homepage (Root path)
get '/' do
  erb :index
end

get '/cookies' do
  @cookies = cookies.select {|name, content| name != 'rack.session'}
  erb :cookies
end
