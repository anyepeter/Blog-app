require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'creates a post for a user' do
    it 'displays the post created' do
      # display a page
      visit user_posts_path(1)
      # add post
      sleep(1)
      assert_text 'Create a new post'
      click_button('Create a new post')

      #   # fill the form with text
      sleep(1)
      fill_in 'post[Title]', with: 'Yet another post..'
      fill_in 'post[Text]', with: 'This is another post hope you like reading..'

      sleep(1)
      click_button 'Create Post'
      sleep(2)
    end
  end
end
