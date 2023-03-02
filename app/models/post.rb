class Post < ApplicationRecord
  belong_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes
end
