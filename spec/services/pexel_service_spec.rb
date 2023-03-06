require 'rails_helper'

RSpec.describe PexelService do
  describe '#get_images' do
    it 'returns 10 images based off a country', :vcr do
      images = PexelService.get_images('russia')
      expect(images).to be_a(Array)
      expect(images.count).to eq(10)
      
      images.each do |image|
        expect(image).to have_key(:src)
        expect(image[:src]).to be_a(Hash)
        expect(image[:src]).to have_key(:original)
        expect(image[:src][:original]).to be_a(String)

        expect(image).to have_key(:alt)
        expect(image[:alt]).to be_a(String)
      end
    end
  end
end