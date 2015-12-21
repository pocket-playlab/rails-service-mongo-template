require 'rails_helper'

RSpec.describe ErrorsController, type: :request do
  context 'when requesting arbitrary path' do
    it 'returns 404 with json response' do
      get "/#{SecureRandom.hex}"
      expect(response.status).to eq 404
      expect(response.headers['Content-Type']).to start_with 'application/json'
      expect(JSON.parse response.body).to eq('error' => 'NotFound')
    end
  end
end
