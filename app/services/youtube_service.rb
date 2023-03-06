class YoutubeService

  def self.get_video_by_country(country)
    response = conn.get("?channelId=UCluQ5yInbeAkkeCndNnUhpw&type=video&key=#{ENV['YOUTUBE_KEY']}&q=#{country}&part=snippet")
    JSON.parse(response.body, symbolize_names: true)[:items][0]
  end

  def self.conn
    Faraday.new('https://youtube.googleapis.com/youtube/v3/search')
  end
end