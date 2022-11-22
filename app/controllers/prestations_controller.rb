class PrestationsController < ApplicationController

  def show
    @prestation = Prestation.find(params[:id])
  end
end
