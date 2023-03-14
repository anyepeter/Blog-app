require 'rails_helper'

RSpec.describe 'Users index page', type: :system do
  describe 'check the content of the index page' do
    before(:each) do
      @user_one = User.create(name: 'Chendi',
                              photo: 'https://play-lh.googleusercontent.com/UjaAdTYsArv7zAJbqGWjQw2ftuOtnAlvokffC3TQQ2K12mwk0YdXUF2wZBTBA2kDZIk',
                              bio: 'software engineer', posts_counter: 0)
      @user_two = User.create(name: 'peter',
                              photo: 'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863',
                              bio: 'software engineer', posts_counter: 0)
      @user_three = User.create(name: 'Soe', photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp',
                                bio: 'software engineer')

      visit users_path
    end

    it 'the page should contain a content' do
      expect(page).to have_content('Here is a list of Users')
    end

    it 'profile picture for each user.' do
      expect(page).to have_selector('img')
    end

    it 'the number of posts each user has written' do
      expect(page).to have_content('Number of posts:')
    end

    it 'When I click on a user, I am redirected to that user show page' do
      assert_text 'peter'
      click_on 'peter'
      expect(page).to have_content('software engineer')
    end
  end
end
