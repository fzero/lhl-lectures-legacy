class User < ActiveRecord::Base

  validates :name, presence: true
  validate :valid_email

  has_many :posts
  has_many :comments, dependent: :destroy

  after_create :send_confirmation_email
  before_destroy :check_if_admin


  def valid_email
    errors.add(:email, "Is not valid") unless email =~ /.*?\@.*?\..*/
  end


  def send_confirmation_email
    puts "Sending confirmation email to #{name} (#{email})."
  end


  # before_* callbacks will only stop actions if they return false
  def check_if_admin
    if admin?
      errors.add(:admin, "You can't delete admin users")
      return false
    end
  end

end

