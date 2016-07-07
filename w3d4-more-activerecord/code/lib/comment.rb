class Comment < ActiveRecord::Base

  belongs_to :post
  # def post
  #   Post.find_by(id: post_id)
  # end

  belongs_to :user

  after_create :increment_user_comment_count, if: :user

  def increment_user_comment_count
    # return unless user
    user.comment_count = user.comment_count.to_i + 1
    user.save
  end

end
