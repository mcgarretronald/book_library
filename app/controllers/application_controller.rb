class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :handle_standard_error

  private

  def handle_standard_error(exception)
    logger.error(exception.message)
    flash[:alert] = "Something went wrong. Please try again later."
    redirect_back(fallback_location: root_path)
  end
  allow_browser versions: :modern
end
