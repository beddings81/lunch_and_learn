require 'rails_helper'

RSpec.describe CountryService do
  describe 'get_random_country' do
    it 'will return a random country name', :vcr do
      country = CountryService.get_random_country

      expect(country).to be_a(Hash)

      expect(country).to have_key(:name)
      expect(country[:name]).to be_a(Hash)

      expect(country[:name]).to have_key(:common)
      expect(country[:name][:common]).to be_a(String)

    end
  end
end