# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Cms::Application.config.secret_key_base = 'd29f600efdb773da4f9b05533b3a9a17d74197347631b768346cbae5c987eb6511a8a896a251d986ca031e1dc1a6760eda61c5e142e8c2a4f01f302c9a142b07'
