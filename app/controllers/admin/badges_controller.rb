class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, except: %i[index new create]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_file_name, :rule_title, :rule_value)
  end

end
