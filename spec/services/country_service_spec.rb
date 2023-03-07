require 'rails_helper'

RSpec.describe CountryService do
  describe '#get_random_country' do
    it 'will return a random country name', :vcr do
      country = CountryService.get_random_country

      expect(country).to be_a(Hash)

      expect(country).to have_key(:name)
      expect(country[:name]).to be_a(Hash)

      expect(country[:name]).to have_key(:common)
      expect(country[:name][:common]).to be_a(String)

    end
  end

  describe '#get_capital city' do
    it 'will return the capital city of a country' do
      country = CountryService.get_capital_city("France")

      expect(country).to be_a(Hash)
      expect(country).to have_key(:capital)
      expect(country[:capital]).to be_a(Array)
      expect(country[:capital][0]).to eq("Paris")

      expect(country).to have_key(:capitalInfo)
      expect(country[:capitalInfo]).to be_a(Hash)
      expect(country[:capitalInfo]).to have_key(:latlng)
      expect(country[:capitalInfo][:latlng]).to be_a(Array)
      expect(country[:capitalInfo][:latlng][0]).to eq(48.87)
      expect(country[:capitalInfo][:latlng][1]).to eq(2.33)

    end
  end
end