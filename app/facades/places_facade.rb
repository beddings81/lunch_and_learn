class PlacesFacade
  def self.get_attractions_by_radius(lon, lat)
    results = PlacesService.get_attractions_by_radius(lon, lat)
    results.map { |result| TouristSight.new(result) }
  end
end