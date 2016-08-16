# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin user
User.create!(
  fname: 'Fabio',
  lname: 'Neves',
  email: 'fabio@example.com',
  password: 'secret!',
  admin: true
)

# Normal user
User.create!(
  fname: 'Random',
  lname: 'Person',
  email: 'rando@example.com',
  password: 'password',
  admin: false
)
