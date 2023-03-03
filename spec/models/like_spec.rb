require 'rails_helper'

RSpec.describe Like, type: :model do
    context 'validations' do
        it 'is valid with valid attributes' do
          expect(Like.new(posts_id: 1, author_id: 1)).to be_valid
        end
        it 'is not valid without a content' do
          expect(Like.new).to_not be_valid
        end
      end
      context 'check increment' do 
        it 'Should increment by one' do 
            post = Post.create(author_id: 1, Title: 'Greetings', Text: 'This is my first post')
            comment = Like.new(author_id: 1, posts_id: 1)
            expect(Post.find(1).CommentsCounter).to be 1
        end
    end  
end