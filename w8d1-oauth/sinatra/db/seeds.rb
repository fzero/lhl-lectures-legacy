require 'faker'

# Create main user
user = User.create!(
  name: 'Fabio',
  email: 'fabio@example.com',
  password: 'secret!'
)
