require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'check the content of the index page' do 
  before (:each) do      
    @user = User.create(name: 'peter',
     photo: 'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863',
      bio: 'software engineer', posts_counter: 2)
      @post_one = Post.create( author: @user, Title: 'Vue', Text: 'this is my first post', CommentsCounter: 2, LikesCounter: 0)
      @post_two = Post.create( author: @user, Title: 'React', Text: 'I am gonna get a jon in may', CommentsCounter: 0, LikesCounter: 0)
      @cpmment_one = Comment.create(author: @user, posts_id: @post_one.id, text: 'Nice work peter')
      @cpmment_two = Comment.create(author: @user, posts_id: @post_one.id, text: 'great article')
      @cpmment_three = Comment.create(author: @user, posts_id: @post_two.id, text: 'Nice work peter')
      @cpmment_four = Comment.create(author: @user, posts_id: @post_two.id, text: 'great article')

    visit user_posts_path(@user)
  end

  it 'User should see profile picture' do 
    expect(page).to have_selector('img')
   end

   it 'User should see username' do 
    expect(page).to have_content("#{@user.name}")
   end

   it 'User should see the number of posts the user has written' do 
    expect(page).to have_content("Number of Posts : #{@user.posts_counter}")
   end

   it 'User should see the post title' do 
    expect(page).to have_content("#{@post_one.Title}")
   expect(page).to have_content("#{@post_two.Title}")
   end

   it 'User should see the comments of a post' do 
    expect(page).to have_content("Nice work peter")
    expect(page).to have_content("great article")
   end

   it 'User should see the comment counter and like counter' do 
    expect(page).to have_content("Comments: #{@post_one.CommentsCounter}")
    expect(page).to have_content("Likes: #{@post_one.LikesCounter}")
   end

   it 'User should see the pagination button to create a post ' do 
    expect(page).to have_content('Create a new post')
   end

   it 'User should create a posts and see it ' do 
    sleep(1)
    assert_text 'Create a new post'
    click_button('Create a new post')
    sleep(1)
      fill_in 'post[Title]', with: 'Yet another post..'
      fill_in 'post[Text]', with: 'This is another post hope you like reading..'

      sleep(1)
     click_button 'Create Post'
   end
end
end
  
#    describe 'displays detailed page of a single post' do
#     it 'displays a single post' do
#       # navigate to the posts page
#       visit user_posts_path(1)

#       # assert the displayed page
#       assert_text 'hardware'

#       sleep(1)
#       click_on 'hardware'

#       # page.click_link(:id => 'post_link')
#       sleep(1)
#       click_button 'Add a comment'
#       # add a comment
#       sleep(1)
#       fill_in 'comment[text]', with: 'My pleasure Tom!'

#       sleep(1)
#       click_button('Create Comment')

#       #add a like
#       sleep(1)
#       click_button('Save Like')
#     end
# end
# end