class ApplicationController < ActionController::Base
  # layout "main"
  protect_from_forgery with: :exception
  include SessionsHelper
end
