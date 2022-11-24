class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_buddy, only: %i[show profil update]

  def index
    @buddies = User.all
  end

  def show
    @booking = Booking.new
    @prestations = Prestation.all
  end

  def edit
    @buddy = User.find(params[:id])
  end

  def update

    @buddy.update(buddy_params)
    redirect_to buddy_path(@buddy)

  end

  def profil
    @prestations = Prestation.all
  end

  private

  def buddy_params
    params.require(:user).permit(:name, :mail, :description, :photo)
  end

  def set_buddy
    @buddy = User.find(params[:id])
  end

end
