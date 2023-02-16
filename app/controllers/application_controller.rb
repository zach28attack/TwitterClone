class ApplicationController < ActionController::Base
  # this code is the 'easy way' to whitelist parameters when using devise 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q
  
  def set_q
    @q = User.ransack(params[:id])
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name])
  end
  def after_sign_out_path_for scope
    tweets_path
  end
end