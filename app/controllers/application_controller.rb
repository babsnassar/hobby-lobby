class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :organization_name, :sector, :location, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :organization_name, :sector, :location, :photo])
  end

  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end
end
