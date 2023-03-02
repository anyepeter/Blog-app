class Post < ApplicationRecord
  belong_to :users
  has_many :comments
  has_many :likes
end
