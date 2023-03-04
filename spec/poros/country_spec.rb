require 'rails_helper'

RSpec.describe Country do
  it 'exist and has attributes' do
    country = CountryFacade.get_random_country

    expect(country).to be_a(Country)
    expect(country.name).to be_a(String)
  end
end