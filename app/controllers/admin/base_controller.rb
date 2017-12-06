class Admin::BaseController < ApplicationController

  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found


  private

  def admin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless is_admin?
  end

end
