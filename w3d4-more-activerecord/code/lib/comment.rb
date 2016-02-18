class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  after_create :increment_user_comment_count, if: :user

  def increment_user_comment_count
    comment_count = user.comment_count.to_i
    user.comment_count = comment_count + 1
    user.save
  end

end
