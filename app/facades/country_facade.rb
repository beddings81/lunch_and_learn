class CountryFacade

  def self.get_capital_city(country)
    capital = CountryService.get_capital_city(country)
    Capital.new(capital)
  end

  def self.get_random_country
    country = CountryService.get_random_country
    Country.new(country)
  end
end