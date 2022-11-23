class PrestationsController < ApplicationController
  def index
    @prestations = Prestation.all
  end

  def show
    @prestation = Prestation.find(params[:id])
  end

  def user_prestations
    @prestations = Prestation.where(user_id: current_user.id)
  end
end
