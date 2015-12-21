require 'rails_helper'

RSpec.describe StatusController, type: :request do
  describe '#check' do
    context 'when database is disconnected' do
      it 'the service is unavailable' do
        allow(Mongoid::Clients.default).to receive(:collections)
          .and_raise(Mongo::Error::NoServerAvailable)
        get '/status'
        expect(status).to eq(503)
        expect(body[:errors]).to include(:database)
      end
    end

    context 'when the database is connected' do
      it 'should render 200 when everything is ok' do
        get '/status'
        expect(status).to eq(200)
        expect(body[:errors]).to be_empty
      end
    end
  end
end
