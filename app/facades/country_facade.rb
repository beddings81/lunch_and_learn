class CountryFacade
  def self.get_random_country
    country = CountryService.get_random_country
    Country.new(country)
  end
end