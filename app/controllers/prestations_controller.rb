class PrestationsController < ApplicationController
  def index
    @prestations = Prestation.all
  end

  def show
    @prestation = Prestation.find(params[:id])
  end
end
