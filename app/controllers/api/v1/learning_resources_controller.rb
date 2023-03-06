class Api::V1::LearningResourcesController < ApplicationController
  def index
    images = ImageFacade.get_images(params[:country])
    video = VideoFacade.get_video_by_country(params[:country])
    learning_resource = LearningResourceFacade.by_country(params[:country], video, images)
    render json: LearningResourceSerializer.new(learning_resource)
  end
end