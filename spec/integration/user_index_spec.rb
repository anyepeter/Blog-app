require 'rails_helper'

RSpec.describe 'Users page', type: :feature do
    before(:all) do 
        visit users_path
    end
describe 'display the user index page' do
    it 'should have all usernames for all users' do
        expect(page).to have_selector('h2', text: 'Tom')
        expect(page).to have_selector('h2', text: 'Lilly')
        expect(page).to have_selector('h2', text: 'Peter')
      end
end
end
