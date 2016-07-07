class CommentCountOnUser < ActiveRecord::Migration

  def change
    remove_column :posts, :comment_count, :integer
    add_column :users, :comment_count, :integer
    add_column :comments, :user_id, :integer
  end

end
