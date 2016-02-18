class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  after_create :increment_user_comment_count
end
