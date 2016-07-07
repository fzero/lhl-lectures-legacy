class User < ActiveRecord::Base

  validates :name, presence: true
  validate :valid_email

  has_many :posts
  # def posts
  #   Post.where(user_id: id)
  # end

  has_many :comments, dependent: :destroy

  after_create :send_confirmation_email
  after_save :run_this_after_i_save_something
  before_destroy :check_if_admin


  def valid_email
    errors.add(:email, "Is not valid") unless email =~ /.*?\@.*?\..*/
  end


  def run_this_after_i_save_something
    puts "------- YOU ARE SAVED!"
  end


  def send_confirmation_email
    puts "------- Sending confirmation email to #{name} (#{email})."
  end


  # before_* callbacks will only stop actions if they return false
  def check_if_admin
    if admin?
      errors.add(:admin, "You can't delete admin users")
      throw :abort # New in ActiveRecord 5
      return false
    end
  end

end

