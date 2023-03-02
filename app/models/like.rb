class Like < ApplicationRecord
  belong_to :post
  belong_to :user

  after_save :likes_counters

  def likes_counters
     Post.find(posts_id).increment!(:LikesCounter)
  end
end
