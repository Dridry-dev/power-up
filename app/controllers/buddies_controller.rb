class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_buddy, only: :show

  def index
    @buddies = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :description, :photo)
  end

  def set_buddy
    @buddy = User.find(params[:id])
  end
end