class Video
  attr_reader :title, :youtube_video_id

  def initialize(data)
    if data.present?
      @title = data[:snippet][:title]
      @youtube_video_id = data[:id][:videoId]
    end
  end
end