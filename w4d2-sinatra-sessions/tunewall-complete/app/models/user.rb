class User < ActiveRecord::Base

  # We can't be too careful! Never store passwords in plain text!
  # You need to install the bcrypt gem for this to work.
  has_secure_password

  has_many :tunes, dependent: :destroy

  def first_name
    name.split(' ').first.capitalize
  end

end
