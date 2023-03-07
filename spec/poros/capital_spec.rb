require 'rails_helper'

RSpec.describe Capital do
  it 'exist and has attributes' do
    capital = CountryFacade.get_capital_city("France")

    expect(capital).to be_a(Capital)
    expect(capital.name).to eq('Paris')
    expect(capital.lat).to eq(48.87)
    expect(capital.lon).to eq(2.33)
  end
end