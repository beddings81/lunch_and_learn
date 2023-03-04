require 'rails_helper'

RSpec.describe Recipe do
  it 'exist and has attributes' do
    recipe = RecipeFacade.recipes_by_country("aruba")[0]


    expect(recipe).to be_a(Recipe)
    expect(recipe.id).to eq(nil)
    expect(recipe.title).to eq("Aruba + A Blue Cheese Iceberg Wedge")
    expect(recipe.url).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_d208694347a63750e26bbf1f3c0a1e7e")
    expect(recipe.country).to eq("aruba")
    expect(recipe.image).to be_a(String)
  end
end