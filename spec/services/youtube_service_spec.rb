require 'rails_helper'

RSpec.describe YoutubeService do
  describe '#get_video_by_country' do
    it 'returns a youtube video based off the country', :vcr do
      video_response = YoutubeService.get_video_by_country('russia')
      
      expect(video_response).to have_key(:id)
      expect(video_response[:id]).to be_a(Hash)
      expect(video_response[:id]).to have_key(:videoId)
      expect(video_response[:id][:videoId]).to be_a(String)

      expect(video_response).to have_key(:snippet)
      expect(video_response[:snippet]).to have_key(:title)
      expect(video_response[:snippet][:title]).to be_a(String)
    end
  end
end