require 'pry' # incase you want to use binding.pry
require 'active_record'
require_relative 'lib/user'
require_relative 'lib/post'
require_relative 'lib/comment'

# Config variables
APP_ENV = ENV['APP_ENV'] || 'development'
DB_NAME = "w3d4_#{APP_ENV}"

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  database: DB_NAME,
  username: 'fzero', # Change to your username
  password: '',      # and password (if any)
  host: 'localhost',
  port: 5432,
  min_messages: 'error'
)
ActiveRecord::Base.connection
puts "CONNECTED"
