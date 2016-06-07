require_relative "country"
require "pry"

countries = Country.all
countries.each do |country|
  puts country.name
end

country = Country.find(4)

puts country.name
