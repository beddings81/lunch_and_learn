class VideoFacade
  def self.get_video_by_country(country)
    result = YoutubeService.get_video_by_country(country)
    Video.new(result)
  end
end