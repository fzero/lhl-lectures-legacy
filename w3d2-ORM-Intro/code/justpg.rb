require_relative 'db'
require 'pry'

DB.exec("SELECT * FROM countries;") do |results|
  results.each do |country|
    p country["name"]
  end
end

# puts "Which ID do you want? "
# id = gets.chomp

# DB.exec_params("SELECT * FROM countries WHERE id=$1 AND name=$2;", [id, name]) do |results|
#   p results[0]
# end
