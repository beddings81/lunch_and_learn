require 'rails_helper'

RSpec.describe 'Tourist sights API', type: :request do
  describe 'tourist sights by country and radius' do
    it 'returns tourist attractions for a given country and radius' do

      get '/api/v1/tourist_sights?country=France'

      expect(response).to be_successful

      tourist_sights = JSON.parse(response.body, symbolize_names: true)

      expect(tourist_sights).to have_key(:data)
      expect(tourist_sights[:data]).to be_a(Array)

      tourist_sights[:data].each do |tourist_sight|
        expect(tourist_sight).to have_key(:id)
        expect(tourist_sight[:id]).to eq(nil)

        expect(tourist_sight).to have_key(:type)
        expect(tourist_sight[:type]).to eq("tourist_sight")

        expect(tourist_sight).to have_key(:attributes)
        expect(tourist_sight[:attributes]).to be_a(Hash)

        expect(tourist_sight[:attributes]).to have_key(:name)
        expect(tourist_sight[:attributes][:name]).to be_a(String)
        
        expect(tourist_sight[:attributes]).to have_key(:address)
        expect(tourist_sight[:attributes][:address]).to be_a(String)
        
        expect(tourist_sight[:attributes]).to have_key(:place_id)
        expect(tourist_sight[:attributes][:place_id]).to be_a(String)
      end
    end

    it 'returns an empty array if there a no attractions' do
      get '/api/v1/tourist_sights?country=thisisnotreal'

      expect(response).to be_successful

      tourist_sights = JSON.parse(response.body, symbolize_names: true)

      expect(tourist_sights).to have_key(:data)
      expect(tourist_sights[:data]).to be_a(Array)
      expect(tourist_sights[:data]).to eq([])
    end
  end
end