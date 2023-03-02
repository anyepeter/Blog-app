class Like < ApplicationRecord
    belong_to:posts, foreign_key: 'PostId' class_name: 'Post'
    belong_to:users, foreign_key: 'AuthorId' class_name: 'User'
end
