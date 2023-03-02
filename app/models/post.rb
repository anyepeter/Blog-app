class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

   def update_post_counter
      User.find(author_id).increment!(:posts_counter)
   end

   def recent_comments
    Comment.where(posts_id: 4).order(created_at: :desc).limit(5)
   end
end


