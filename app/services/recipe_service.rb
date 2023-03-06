class RecipeService

  def self.recipes_by_country(country)
    if country.present?
      response = conn.get("?type=public&q=#{country}&app_id=#{ENV['RECIPE_ID']}&app_key=#{ENV['RECIPE_KEY']}")
      # require 'pry'; binding.pry
      JSON.parse(response.body, symbolize_names: true)[:hits]
    end
  end

  def self.conn
    Faraday.new("https://api.edamam.com/api/recipes/v2")
  end
end