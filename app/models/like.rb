class Like < ApplicationRecord
  belong_to :post
  belong_to :user
end
