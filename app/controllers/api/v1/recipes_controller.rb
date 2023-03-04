class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == ""
      render json: ErrorSerializer.no_recipes
    else
      country = params[:country].presence || CountryFacade.get_random_country.name
      recipes = RecipeFacade.recipes_by_country(country)
      if !recipes.nil?
        render json: RecipeSerializer.new(recipes)
      else
        render json: ErrorSerializer.no_recipes
      end
    end
  end
end