class BadgesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_badges, only: %i[index]
  before_action :find_my_badges, only: %i[my_badges]

  def index
  end

  def my_badges

  end

  private

  def find_badges
    @badges = Badge.all
  end

  def find_my_badges
    @my_badges = current_user.badges
  end

end
