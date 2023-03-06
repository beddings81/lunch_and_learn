require 'rails_helper'

RSpec.describe 'Learning resouces API', type: :request do
  describe 'learning resources by country' do
    describe 'happy path' do
      it 'returns a learning resource for a given country', :vcr do

        get "/api/v1/learning_resources?country=thailand"

        expect(response).to be_successful

        lr = JSON.parse(response.body, symbolize_names: true)

        expect(lr).to be_a(Hash)
        expect(lr).to have_key(:data)
        expect(lr[:data]).to have_key(:id)
        expect(lr[:data][:id]).to eq(nil)

        expect(lr[:data]).to have_key(:attributes)
        expect(lr[:data][:attributes]).to be_a(Hash)
        expect(lr[:data][:attributes]).to have_key(:country)
        expect(lr[:data][:attributes][:country]).to be_a(String)

        expect(lr[:data][:attributes]).to have_key(:video)
        expect(lr[:data][:attributes][:video]).to be_a(Hash)
        expect(lr[:data][:attributes][:video]).to have_key(:title)
        expect(lr[:data][:attributes][:video]).to have_key(:youtube_video_id)

        expect(lr[:data][:attributes]).to have_key(:images)
        expect(lr[:data][:attributes][:images]).to be_a(Array)

        lr_images = lr[:data][:attributes][:images]
        lr_images.each do |image|
          expect(image).to have_key(:alt_tag)
          expect(image).to have_key(:url)
        end
      end
    end

    describe 'sad path' do
      it 'returns images as an empty array and video as an empty hash', :vcr do

        get '/api/v1/learning_resources?country=thisisfake'

        expect(response).to be_successful

        lr = JSON.parse(response.body, symbolize_names: true)

        expect(lr).to be_a(Hash)
        expect(lr).to have_key(:data)
        expect(lr[:data]).to have_key(:id)
        expect(lr[:data][:id]).to eq(nil)

        expect(lr[:data]).to have_key(:attributes)
        expect(lr[:data][:attributes]).to be_a(Hash)
        expect(lr[:data][:attributes]).to have_key(:country)
        expect(lr[:data][:attributes][:country]).to be_a(String)

        expect(lr[:data][:attributes]).to have_key(:video)
        expect(lr[:data][:attributes][:video]).to be_a(Hash)
        expect(lr[:data][:attributes][:video]).to_not have_key(:title)
        expect(lr[:data][:attributes][:video]).to_not have_key(:youtube_video_id)
        expect(lr[:data][:attributes][:video]).to eq({})

        expect(lr[:data][:attributes]).to have_key(:images)
        expect(lr[:data][:attributes][:images]).to be_a(Array)
        expect(lr[:data][:attributes][:images]).to eq([])
      end
    end
  end
end