class Like < ApplicationRecord
  belong_to :posts
  belong_to :users
end
