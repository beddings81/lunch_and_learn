require 'rails_helper'

RSpec.describe Image do
  it 'exist and has attributes', :vcr do
    image = ImageFacade.get_images("russia")[0]


    expect(image).to be_a(Image)
    expect(image.url).to eq("https://images.pexels.com/photos/236294/pexels-photo-236294.jpeg")
    expect(image.alt_tag).to eq("St. Peter Basilica, Russia Under Clouded Sky")
  end
end