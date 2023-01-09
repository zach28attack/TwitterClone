class ApplicationController < ActionController::Base
  # this code is the 'easy way' to whitelist parameters when using devise 
  # here -->
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
  end
  # <--to here
end
