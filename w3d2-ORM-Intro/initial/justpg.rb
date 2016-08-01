# This script is using only PG to do all operations.
# No classes or instances were harmed in the making of this script.

require_relative 'db'
require 'pry'

# This is the blueprint for our Country.all method
DB.exec("SELECT * FROM countries;") do |results|
  results.each do |country|
    p country["name"]
  end
end


# And this is pretty much Country.find(id)
puts "Which ID do you want? "
id = gets.chomp

DB.exec_params("SELECT * FROM countries WHERE id=$1;", [id]) do |results|
  p results[0]
end
