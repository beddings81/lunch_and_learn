require 'rails_helper'

RSpec.describe CountryFacade do
  describe '#get_random_country' do
    it 'returns a random country poro' do
      country = CountryFacade.get_random_country

      expect(country).to be_a(Country)
    end
  end
end