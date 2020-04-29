require 'rails_helper'

RSpec.describe 'Votes', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/votes/create'
      expect(response).to have_http_status(:success)
    end
  end
end
