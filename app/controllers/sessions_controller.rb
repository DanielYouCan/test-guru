class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      cookies[:current_url] ||= root_path
      session[:user_id] = user.id
      redirect_to cookies[:current_url]
    else
      flash.now[:alert] = 'Wrong input! Check it for mistakes'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out'
    redirect_to login_path
  end

end
