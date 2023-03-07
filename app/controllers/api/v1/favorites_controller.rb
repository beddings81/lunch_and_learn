class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by_api_key(params[:api_key])
    if user
      new_favorite = user.favorites.create(favorite_params) 
      render json: FavoriteSerializer.successfully_created, status: 201
    else
      render json: FavoriteSerializer.failed_to_created, status: 400
    end
  end

  private

    def favorite_params
      params.permit(:country, :recipe_link, :recipe_title)
    end
end