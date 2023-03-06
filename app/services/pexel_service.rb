class PexelService

  def self.get_images(country)
    response = conn.get("?query=#{country}&per_page=10")
    JSON.parse(response.body, symbolize_names: true)[:photos]
  end

  def self.conn
    Faraday.new('https://api.pexels.com/v1/search', headers: {'Authorization' => ENV['PEXEL_KEY']})
  end
end