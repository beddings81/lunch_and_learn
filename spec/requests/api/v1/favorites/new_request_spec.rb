require 'rails_helper'

RSpec.describe 'Favorites new API' do
  describe 'new favorite' do
    describe 'happy path' do
      it 'creates a new favorite' do
        user = User.create!(name: "Barry Bonds", email: "bb@email.com", api_key: "testkey")

        favorite_params = {
                          "api_key": "testkey",
                          "country": "thailand",
                          "recipe_link": "https://www.tastingtable.com/",
                          "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                          }

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

        expect(response).to be_successful
        expect(response.status).to eq(201)

        favorite_response = JSON.parse(response.body, symbolize_names: true)

        expect(favorite_response).to be_a(Hash)
        expect(favorite_response).to have_key(:success)
        expect(favorite_response[:success]).to be_a(String)
        expect(favorite_response[:success]).to eq("Favorite added successfully")
      end
    end

    describe 'sad_path' do
      it 'fails to create a favorite' do

        favorite_params = {
                          "api_key": "testkey",
                          "country": "thailand",
                          "recipe_link": "https://www.tastingtable.com/",
                          "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                          }

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        favorite_response = JSON.parse(response.body, symbolize_names: true)

        expect(favorite_response).to be_a(Hash)
        expect(favorite_response).to have_key(:error)
        expect(favorite_response[:error]).to be_a(Array)
        favorite_response[:error].each do |error|
          expect(error).to have_key(:title)
          expect(error[:title]).to eq("No user with that api key was found")
          expect(error).to have_key(:status)
          expect(error[:status]).to eq(400)
        end
      end
    end
  end
end