class User < ActiveRecord::Base

  has_many :tunes, dependent: :destroy

end
