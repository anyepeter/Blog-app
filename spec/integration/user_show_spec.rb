require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'displays all users' do
    it 'displays all users' do
      # display a page
      visit users_path

      # assert the displayed page
      assert_text 'Tom'

      # navigate to the show page
      sleep(1)
      click_on('Tom')

      # assert the displayed page
      sleep(1)
      assert_text 'Bio'
    end
  end
end