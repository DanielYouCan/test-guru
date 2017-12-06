class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :is_admin?

  private

  def after_sign_in_path_for(resource)
    return super unless resource.is_a?(Admin)
    admin_tests_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def is_admin?
    current_user.is_a?(Admin)
  end

end
