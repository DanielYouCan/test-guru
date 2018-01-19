class BadgesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_badges, only: %i[index my_badges]

  def index
  end

  def my_badges
    render 'index'
  end

  private

  def find_badges
    @badges = request.original_url.include?("all") ? Badge.all : current_user.badges
  end

end
