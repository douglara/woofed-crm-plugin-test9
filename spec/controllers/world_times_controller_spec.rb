require 'rails_helper'

RSpec.describe 'Accounts::WorldTimesController', type: :request do
  let!(:account) { create(:account) }
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET /accounts/:account_id/world_times' do
    it 'returns a successful response' do
      get "/accounts/#{account.id}/world_times"

      expect(response).to have_http_status(:success)
    end

    it 'displays time zones' do
      get "/accounts/#{account.id}/world_times"

      expect(response.body).to include('Sao Paulo')
      expect(response.body).to include('Brisbane')
      expect(response.body).to include('New York')
    end

    it 'displays date, time, and day of week' do
      get "/accounts/#{account.id}/world_times"

      expect(response.body).to include('Date')
      expect(response.body).to include('Time')
      expect(response.body).to include('Day')
    end

    it 'displays UTC offset' do
      get "/accounts/#{account.id}/world_times"

      expect(response.body).to include('UTC Offset')
    end

    it 'displays country flags' do
      get "/accounts/#{account.id}/world_times"

      expect(response.body).to include('🇧🇷')
      expect(response.body).to include('🇦🇺')
      expect(response.body).to include('🇺🇸')
    end
  end
end
