class PrestationsController < ApplicationController
  def index
    @prestations = Prestation.all
  end

  def new
    @prestation = Prestation.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
