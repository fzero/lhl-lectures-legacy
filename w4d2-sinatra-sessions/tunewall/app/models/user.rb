class User < ActiveRecord::Base

  has_many :tunes, dependent: :destroy

  def first_name
    name.split(' ').first.capitalize
  end

end
