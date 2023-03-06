require 'rails_helper'

RSpec.describe LearningResourceFacade do
  describe '#by_country' do
    it 'returns a learning resource poro', :vcr do
      country = "russia"
      video = {
                "title": "A Super Quick History of Russia",
                "youtube_video_id": "0lD_6RVKDS8"
              }

      images = [
                {
                    "alt_tag": "St. Peter Basilica, Russia Under Clouded Sky",
                    "url": "https://images.pexels.com/photos/236294/pexels-photo-236294.jpeg"
                },
                {
                    "alt_tag": "Saint Basil's Cathedral",
                    "url": "https://images.pexels.com/photos/753339/pexels-photo-753339.jpeg"
                }
                ]

      lr = LearningResource.new(country, video, images)

      expect(lr).to be_a(LearningResource)
    end
  end
end