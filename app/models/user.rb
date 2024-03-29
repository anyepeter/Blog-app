class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id', class_name: 'Post'
  has_many :likes, foreign_key: 'author_id', class_name: 'Like'
  has_many :comments, foreign_key: 'author_id', class_name: 'Comment'

  validates :name, presence: true
  validates :posts_counter, numericality: true, comparison: { greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
