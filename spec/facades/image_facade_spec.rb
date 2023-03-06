require 'rails_helper'

RSpec.describe ImageFacade do
  describe '#get_images' do
    it 'creates image poros', :vcr do
      images = ImageFacade.get_images("russia")

      expect(images).to be_a(Array)

      images.each do |image|
        expect(image).to be_a(Image)
      end
    end
  end
end