class Api::V1::UsersController < ApplicationController
  def create
    @api_key = SecureRandom.hex
    user = User.create!(user_params)
    render json: UserSerializer.new(user), status: 201
  end

  private

    def user_params
      params.require(:user).permit(:name, :email).merge(api_key: @api_key)
    end
end