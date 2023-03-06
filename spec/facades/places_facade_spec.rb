require 'rails_helper'

RSpec.describe PlacesFacade do
  describe '#get_attractions_by_radius' do
    it 'returns tourist sights poros based off a radius' do
      tourist_sights = PlacesFacade.get_attractions_by_radius(2.33, 48.87)

      tourist_sights.each do |tourist_sight|
        expect(tourist_sight).to be_a(TouristSight)
      end
    end
  end
end