class PlacesService

  def self.get_attractions_by_radius(lon, lat)
    response = conn.get("?filter=circle:#{lon},#{lat},1000&categories=tourism.sights&api_key=#{ENV['PLACES_KEY']}")
    JSON.parse(response.body, symbolize_names: true)[:features]
  end

  def self.conn
    Faraday.new("https://api.geoapify.com/v2/places")
  end
end