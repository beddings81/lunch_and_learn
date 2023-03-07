require 'rails_helper'

RSpec.describe TouristSight do
  it 'exist and has attributes' do
    tourist_sight = PlacesFacade.get_attractions_by_radius(2.33, 48.87)[0]

    expect(tourist_sight).to be_a(TouristSight)
    expect(tourist_sight.name).to eq("Palais du Louvre")
    expect(tourist_sight.address).to eq("Louvre Palace, Avenue du Général Lemonnier, 75001 Paris, France")
    expect(tourist_sight.place_id).to eq("518d1bce0ed2af02405927f526f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265")
  end
end