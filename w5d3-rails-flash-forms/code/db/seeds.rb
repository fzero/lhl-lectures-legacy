# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

100.times do
  Article.create!({
    title: Faker::Book.title,
    text: Faker::Lorem.paragraph,
    published: (rand(2) > 0)
  })
end
