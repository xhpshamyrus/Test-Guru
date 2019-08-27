class Admin::BadgesController < Admin::BaseController

  before_action :authenticate_user!
  before_action :find_badge, only: %i[show edit update destroy]

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
      redirect_to admin_badges_path(@badge), notice: "Badge has been created"
    else
      render :new
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: "Badge deleted"
  end

  def update
    if @badge.update(badge_params)

      redirect_to admin_badges_path(@badge), notice: "Updated"
    else
      render :edit
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule_type, :rule_value)
  end
end
