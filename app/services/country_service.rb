class CountryService

  def self.get_random_country
    response = conn.get("/v3.1/all")
    data = JSON.parse(response.body, symbolize_names: true).sample
  end

  def self.conn
    Faraday.new("https://restcountries.com")
  end
end