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

# OAuth callback - GET
get "/auth/:provider/callback" do
  @authdata = env['omniauth.auth']
  erb :callback
end

# OAuth callback - GET
post "/auth/:provider/callback" do
  @authdata = env['omniauth.auth']
  erb :callback
end

get '/auth/failure' do
  flash[:notice] = params[:message] # if using sinatra-flash or rack-flash
  redirect '/'
end
