require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'POST /users/:id/posts/id/comments/new' do
    before(:example) { get '/users/1/posts/5/comments/new' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
