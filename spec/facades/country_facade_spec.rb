require 'rails_helper'

RSpec.describe CountryFacade do
  describe '#get_random_country' do
    it 'returns a random country poro' do
      country = CountryFacade.get_random_country

      expect(country).to be_a(Country)
    end
  end

  describe '#get_capital_city' do
    it 'returns the capital of a country' do
      capital = CountryFacade.get_capital_city("France")

      expect(capital).to be_a(Capital)
    end
  end
end