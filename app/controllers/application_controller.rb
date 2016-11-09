class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def main
    render json: {}, status: :ok
  end
  
end
