require 'rails_helper'

RSpec.describe VideoFacade do
  describe '#get_video_by_country' do
    it 'makes a video poro out of the response', :vcr do
      video = VideoFacade.get_video_by_country("russia")
  
      expect(video).to be_a(Video)
    end
  end
end