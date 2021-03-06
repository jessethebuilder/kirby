class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    url = request.referer
    if url == new_user_session_url || url == new_user_registration_url
      super
    else
      stored_location_for(resource) || url || root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
