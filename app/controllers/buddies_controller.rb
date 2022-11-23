class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_buddy, only: %i[show edit]

  def index
    @buddies = User.all
  end

  def show
    @booking = Booking.new
    @prestations = Prestation.all
  end

  def edit
  end

  def update
    if @buddy.update(buddy_params)
      redirect_to buddy_path(@buddy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :description, :photo)
  end

  def set_buddy
    @buddy = User.find(params[:id])
  end

end
