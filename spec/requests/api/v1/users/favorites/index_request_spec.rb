require 'rails_helper'

RSpec.describe ' User Favorites new API' do
  describe 'user favorites' do
    describe 'happy path' do
      it 'returns a users favorites' do
        user = User.create!(name: "Barry Bonds", email: "bb@email.com", api_key: "testkey")
        user.favorites.create!(user_id: user.id, country: "thailand", recipe_link: "https://www.tastingtable.com/", recipe_title: "Crab Fried Rice")
        user.favorites.create!(user_id: user.id, country: "china", recipe_link: "https://www.dinnertable.com/", recipe_title: "Pork Fried Rice")

        get '/api/v1/favorites?api_key=testkey'
        
        expect(response).to be_successful
        expect(response.status).to eq(200)

        user_favorites = JSON.parse(response.body, symbolize_names: true)

        expect(user_favorites).to have_key(:data)
        expect(user_favorites[:data]).to be_a(Array)

        user_favorites[:data].each do |favorite|
        expect(favorite).to have_key(:id)
        expect(favorite[:id]).to be_a(String)

        expect(favorite).to have_key(:type)
        expect(favorite[:type]).to be_a(String)
        expect(favorite[:type]).to eq("favorite")

        expect(favorite).to have_key(:attributes)
        expect(favorite[:attributes]).to have_key(:id)
        expect(favorite[:attributes]).to have_key(:recipe_title)
        expect(favorite[:attributes]).to have_key(:recipe_link)
        expect(favorite[:attributes]).to have_key(:country)
        expect(favorite[:attributes]).to have_key(:created_at)
        end
      end

      it 'returns data as an empty array if the user has no favorites' do
        user = User.create!(name: "Barry Bonds", email: "bb@email.com", api_key: "testkey")
      
        get '/api/v1/favorites?api_key=testkey'
        
        expect(response).to be_successful
        expect(response.status).to eq(200)

        user_favorites = JSON.parse(response.body, symbolize_names: true)

        expect(user_favorites).to have_key(:data)
        expect(user_favorites[:data]).to be_a(Array)
        expect(user_favorites[:data]).to eq([])
      end
    end

    describe 'sad path' do
      it 'returns an error if a bad api key is given' do
        get '/api/v1/favorites?api_key=testkey'
        
        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        user_favorites = JSON.parse(response.body, symbolize_names: true)

        expect(user_favorites).to have_key(:error)
        expect(user_favorites[:error]).to be_a(Array)
        user_favorites[:error].each do |error|
          expect(error).to have_key(:title)
          expect(error[:title]).to eq("No user with that api key was found")
          expect(error).to have_key(:status)
          expect(error[:status]).to eq(400)
        end
      end
    end
  end
end
