class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :email,
            uniqueness: {case_sensitive: false},
            format: {with: /.*?\@.*?\..*/}

  def name
    "#{first_name} #{last_name}"
  end
end
