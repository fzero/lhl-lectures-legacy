require 'rubygems'
require 'bundler/setup'
require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all' # Requires cookies, among other things

require 'omniauth-twitter'
require 'omniauth-google-oauth2'

require 'pry'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  set :views, File.join(Sinatra::Application.root, "app", "views")

  use OmniAuth::Builder do
    provider :google_oauth2, '198268182547-4efp9mscmc6328t2fe3vlk18e108dumc.apps.googleusercontent.com', 'pys0wjqZSJRZzi6zLPnv-NUG'
    provider :twitter, 'ch8OLPbQPASA0fW72YSvMh3vS', 'NMXZlUTzlT9zgrbiXCS7sPKkI0bQb2tZYgZnHZHiH5uIyZfd1B'
  end
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')
