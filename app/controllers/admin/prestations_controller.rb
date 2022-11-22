class Admin::PrestationsController < ApplicationController
  def index
    @prestations = Prestation.all
  end

  def new
    @prestation = Prestation.new
  end

  def create
    @prestation = Prestation.new(prestation_params)
    @prestation.user = current_user
    if @prestation.save
      redirect_to admin_prestation_path(@prestation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prestation = Prestation.find(params[:id])
  end

  def edit
    @prestation = Prestation.find(params[:id])
  end

  def update
    @prestation = Prestation.find(params[:id])
    @prestation.update(prestation_params)
    redirect_to prestation_path(@prestation)
  end

  def destroy
    @prestation = Prestation.find(params[:id])
    @prestation.destroy
    redirect_to admin_prestation_path
  end

  private

  def prestation_params
    params.require(:prestation).permit(:name, :description, :price)
  end
end
