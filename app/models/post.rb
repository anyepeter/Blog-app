class Post < ApplicationRecord
    belong_to:users, foreign_key: 'Authorid', class_name: 'User'
    has_many :comments, foreign_key: 'PostId', class_name: 'Comment'
    has_many :likes, foreign_key: 'PostId', class_name: 'Like'
end
