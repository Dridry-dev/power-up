class PrestationsController < ApplicationController
  before_action :set_prestation, only: %i[show destroy]

  def index
    @prestations = Prestation.all
  end

  def new
    @prestation = Prestation.new
  end

  def create
    @prestation = Prestation.new(prestation_params)
    # The user of the prestation to create is the current user
    @prestation.user = current_user
    # [...]
  end

  def show
    @prestation = Prestation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def prestation_params
    params.require(:prestation).permit(:name, :description, :price) # Remove :user
  end

  def set_prestation
    @prestation = Prestation.find(params[:id])
  end
end
