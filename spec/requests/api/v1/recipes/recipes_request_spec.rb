require 'rails_helper'

RSpec.describe 'Recipes API', type: :request do
  describe 'recipes by country' do
    describe 'happy path' do
      it 'returns a list of recipes by given country', :vcr do

        get "/api/v1/recipes?country=thailand"

        expect(response).to be_successful
        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a(Hash)
        expect(recipes).to_not have_key(:from)
        expect(recipes).to_not have_key(:to)
        expect(recipes).to_not have_key(:count)
        expect(recipes).to_not have_key(:_links)
        expect(recipes).to_not have_key(:hits)
   
        expect(recipes).to have_key(:data)
        expect(recipes[:data]).to be_a(Array)

        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to eq(nil)

          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to eq("recipe")

          expect(recipe).to have_key(:attributes)
          expect(recipe[:attributes]).to be_a(Hash)

          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes][:title]).to be_a(String)
          
          
          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes][:country]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes][:url]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes][:image]).to be_a(String)
        end 
      end

      it 'returns a list of recipes by a random country', vcr: { record: :new_episodes } do

        get "/api/v1/recipes"

        expect(response).to be_successful
        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a(Hash)
        expect(recipes).to_not have_key(:from)
        expect(recipes).to_not have_key(:to)
        expect(recipes).to_not have_key(:count)
        expect(recipes).to_not have_key(:_links)
        expect(recipes).to_not have_key(:hits)
   
        expect(recipes).to have_key(:data)
        expect(recipes[:data]).to be_a(Array)

        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to eq(nil)

          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to eq("recipe")

          expect(recipe).to have_key(:attributes)
          expect(recipe[:attributes]).to be_a(Hash)

          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes][:title]).to be_a(String)
          
          
          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes][:country]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes][:url]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes][:image]).to be_a(String)
        end
      end
    end

    describe 'sad path' do
      it 'returns data as an empty array if params are an empty string', :vcr do
        get "/api/v1/recipes?country="

        expect(response).to be_successful

        recipe = JSON.parse(response.body, symbolize_names: true)

        expect(recipe).to have_key(:data)
        expect(recipe[:data]).to be_a(Array)
        expect(recipe[:data]).to eq([])
      end
    end
  end
end