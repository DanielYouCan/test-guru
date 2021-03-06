class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  def default_url_options
    return { } if I18n.locale == I18n.default_locale
    { lang: I18n.locale }
  end

  private

  def after_sign_in_path_for(user)
    return super unless user.is_admin?
    admin_tests_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def rescue_with_resource_not_found
    render file: 'public/404.html'
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
