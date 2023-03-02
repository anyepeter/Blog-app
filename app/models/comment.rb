class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
 
  after_save :comment_counter
   
  def comment_counter
    Post.find(posts_id).increment!(:CommentsCounter)
  end
end
