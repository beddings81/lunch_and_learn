require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#recipes_by_country' do
    it 'will return a recipe poro based off the country' do
      recipes = RecipeFacade.recipes_by_country("aruba")

      expect(recipes).to be_a(Array)

      recipes.each do |recipe|
        expect(recipe).to be_a(Recipe)
      end
    end
  end
end