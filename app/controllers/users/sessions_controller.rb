class Users::SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate!(auth_options)
    flash[:login] = "Привет, #{current_user.full_name}"
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

end
