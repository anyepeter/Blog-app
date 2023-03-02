class User < ApplicationRecord
    has_many :posts, foreign_key: 'author_id', class_name: 'Post'
    has_many :likes
    has_many :comments

    def recent_posts
        Post.where(author_id: 1).order(created_at: :desc).limits(3)
      end
end
