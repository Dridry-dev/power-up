class PrestationsController < ApplicationController
  before_action :set_prestation, only: :show

  def show
    @prestation = Prestation.new
  end

  private

  def prestation_params
    params.require(:prestation).permit(:name, :description, :price) # Remove :user
  end

  def set_prestation
    @prestation = Prestation.find(params[:id])
  end
end
