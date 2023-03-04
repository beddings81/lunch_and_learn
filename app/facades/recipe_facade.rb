class RecipeFacade
  def self.recipes_by_country(country)
    results = RecipeService.recipes_by_country(country)
    results.map { |recipe| Recipe.new(recipe, country)} unless results.nil?
  end
end