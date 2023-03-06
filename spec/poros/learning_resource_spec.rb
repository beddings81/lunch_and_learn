require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists and has attributes', :vcr do
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
      expect(lr.id).to eq(nil)
      expect(lr.country).to eq("russia")
      expect(lr.images).to eq([{:alt_tag=>"St. Peter Basilica, Russia Under Clouded Sky", :url=>"https://images.pexels.com/photos/236294/pexels-photo-236294.jpeg"},
              {:alt_tag=>"Saint Basil's Cathedral", :url=>"https://images.pexels.com/photos/753339/pexels-photo-753339.jpeg"}])
      expect(lr.video).to eq({:title=>"A Super Quick History of Russia", :youtube_video_id=>"0lD_6RVKDS8"})
  end
end