# This is a tiny test file to exercise our Country model.

require_relative "country"
require "pry"

countries = Country.all
countries.each do |country|
  puts country.name
end

country = Country.find(4)
puts country.name if country

# Create a new country object and saves it
brazil = Country.new(name: 'Brazil', capital: 'Brazilia')
puts "brazil.saved? == #{brazil.saved?}"
brazil.save
puts "brazil.saved? == #{brazil.saved?}"

# One-step creation
france = Country.create(name: 'France', capital: 'Paris')
puts "france.saved? == #{france.saved?}"

# Delete France (EVIL LAUGH HERE)
france.delete

# Find countries by name
countries = Country.find_by_name('China')
puts countries.inspect
