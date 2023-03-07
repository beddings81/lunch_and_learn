require 'rails_helper'

RSpec.describe PlacesService do
  describe '#get_attractions_by_radius'do
    it 'returns tourist attraction by radius' do
      attractions = PlacesService.get_attractions_by_radius(2.33, 48.87)
      
      expect(attractions).to be_a(Array)   
      attractions.each do |attraction|
        expect(attraction).to have_key(:type)
        expect(attraction).to have_key(:properties)
        expect(attraction[:properties]).to be_a(Hash)
        expect(attraction[:properties]).to have_key(:name)
        expect(attraction[:properties][:name]).to be_a(String)

        expect(attraction[:properties]).to have_key(:formatted)
        expect(attraction[:properties][:formatted]).to be_a(String)

        expect(attraction[:properties]).to have_key(:place_id)
        expect(attraction[:properties][:place_id]).to be_a(String)
      end
    end
  end
end