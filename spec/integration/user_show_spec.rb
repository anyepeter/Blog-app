require 'rails_helper'

RSpec.describe 'Test for the user show page', type: :system do 
 context ' Check the right content for user show page' do 
  before(:each) do
    @new_user = User.create(name: 'peter',
    photo: 'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863',
     bio: 'software engineer', posts_counter: 2)
    @post_one = Post.create(author: @new_user, Title: 'Vue', Text: 'this is my first post', CommentsCounter: 0, LikesCounter: 0)
    @post_two = Post.create(author: @new_user, Title: 'React', Text: 'I am gonna get a jon in may', CommentsCounter: 0, LikesCounter: 0)
    visit user_path(@new_user)
   end

  it 'User should see the other users profile picture' do 
   expect(page).to have_selector('img')
  end

  it 'User should see the user\'s username' do 
   expect(page).to have_content('peter')
  end

  it 'User should see the number of posts the user has written' do 
   expect(page).to have_content("Number of post: #{@new_user.posts_counter}")
  end

  it 'User should see the see the users bio' do 
   expect(page).to have_content('software engineer')
  end

  it 'User should see the see the users recent posts' do 
   expect(page).to have_content("#{@post_one.Text}")
   expect(page).to have_content("#{@post_two.Text}")
  end

  it 'User should see the see  a button that lets me view all of a user\'s posts' do 
   expect(page).to have_content('See all posts')
  end

  it 'User click see all posts, it redirects me to the user\'s post\'s index page' do 
    assert_text 'See all posts'
    sleep(1)
   click_button 'See all posts'
  end
 end
end