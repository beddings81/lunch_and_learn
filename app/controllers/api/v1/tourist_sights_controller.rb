class Api::V1::TouristSightsController < ApplicationController
  def index
    country = params[:country]
    capital = CountryFacade.get_capital_city(country)
    if capital.lon && capital.lat
      tourist_sights = PlacesFacade.get_attractions_by_radius(capital.lon, capital.lat)
      render json: TouristSightSerializer.new(tourist_sights)
    else
      render json: TouristSightSerializer.new([])
    end
  end
end