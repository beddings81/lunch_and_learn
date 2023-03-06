class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record

  def render_invalid_record(exception)
    render json: ErrorSerializer.invalid_record(exception), status: 400
  end

end
