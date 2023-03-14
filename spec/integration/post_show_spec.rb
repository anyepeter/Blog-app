require 'rails_helper'

RSpec.describe 'Posts', type: :system do
 describe 'displays detailed page of a single post' do
    it 'displays a single post' do
      # navigate to the posts page
      visit user_posts_path(1)

      # assert the displayed page
      assert_text 'hardware'

      sleep(1)
      click_on 'hardware'

      # page.click_link(:id => 'post_link')
      sleep(1)
      click_button 'Add a comment'
      # add a comment
      sleep(1)
      fill_in 'comment[text]', with: 'My pleasure Tom!'

      sleep(1)
      click_button('Create Comment')

      #add a like
      sleep(1)
      click_button('Save Like')
    end
   end
  end