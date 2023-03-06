require 'rails_helper'

RSpec.describe RecipeService do
  describe '#recipes_by_country' do
    it 'returns recipes based off a country', :vcr do
      recipes = RecipeService.recipes_by_country("aruba")

      expect(recipes).to be_a(Array)

      recipes.each do |recipe|
        expect(recipe).to have_key(:recipe)
        expect(recipe).to be_a(Hash)

        expect(recipe[:recipe]).to have_key(:uri)
        expect(recipe[:recipe][:uri]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:label)
        expect(recipe[:recipe][:label]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:image)
        expect(recipe[:recipe][:image]).to be_a(String)
      end
    end
  end
end