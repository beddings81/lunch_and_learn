class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by_api_key(params[:api_key])
    if user
      render json: FavoriteSerializer.new(user.favorites)
    else
      render json: FavoritesSerializer.failed_to_created, status: 400
    end
  end

  def create
    user = User.find_by_api_key(params[:api_key])
    if user
      new_favorite = user.favorites.create(favorite_params) 
      render json: FavoritesSerializer.successfully_created, status: 201
    else
      render json: FavoritesSerializer.failed_to_created, status: 400
    end
  end

  private

    def favorite_params
      params.permit(:country, :recipe_link, :recipe_title)
    end
end