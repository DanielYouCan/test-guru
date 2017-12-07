class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Привет, #{current_user.full_name}"
  end

end
