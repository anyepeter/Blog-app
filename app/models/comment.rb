class Comment < ApplicationRecord
  belongs_to :post, foreign_key: 'posts_id', class_name: 'Post'
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'

  validates :text, presence: true

  after_save :comment_counter

  def author_comments(post_id)
    Comment.joins(:users, :posts)
      .select('comments.text', 'users.name')
      .where(posts: { id: post_id })
  end

  private

  def comment_counter
    Post.find(posts_id).increment!(:CommentsCounter)
  end
end
