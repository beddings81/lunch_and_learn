require 'rails_helper'

RSpec.describe Video do
  it 'exist and has attributes', :vcr do
    video = VideoFacade.get_video_by_country('russia')

    expect(video).to be_a(Video)
    expect(video.title).to eq('A Super Quick History of Russia')
    expect(video.youtube_video_id).to eq('0lD_6RVKDS8')
  end
end