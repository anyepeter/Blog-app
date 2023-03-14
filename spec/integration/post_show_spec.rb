require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'check the content of the index page' do 
  before (:each) do      
    @user = User.create(name: 'peter',
     photo: 'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863',
      bio: 'software engineer', posts_counter: 2)
      @post = Post.create( author: @user, Title: 'Vue', Text: 'this is my first post', CommentsCounter: 2, LikesCounter: 2)
      @cpmment_one = Comment.create(author: @user, posts_id: @post.id, text: 'Nice work peter')
      @cpmment_two = Comment.create(author: @user, posts_id: @post.id, text: 'great article')

    visit user_posts_path(@user, @post)
  end

  it 'User should see the post title' do 
    sleep(1)
    expect(page).to have_content("#{@post.Title}")
   end

   it 'User should see wrote the post' do 
    sleep(1)
    expect(page).to have_content("peter")
   end

   it 'User should see  the post body ' do 
    sleep(1)
    expect(page).to have_content("#{@post.Text}")
   end

   it 'User should see comments it has' do 
    sleep(1)
    expect(page).to have_content("Nice work peter")
    expect(page).to have_content("great article")
   end

   it 'User should see username who comment ' do 
    visit user_posts_path(@user, @post)
    sleep(1)
    expect(page).to have_content("peter")
   end
  end
end
