class RecipeService

  def self.recipes_by_country(country)
    if country.present?
      response = conn.get("?type=public&q=#{country}&app_id=#{ENV['APP_ID']}&app_key=#{ENV['API_KEY']}")
      JSON.parse(response.body, symbolize_names: true)[:hits]
    end
  end

  def self.conn
    Faraday.new("https://api.edamam.com/api/recipes/v2")
  end
end