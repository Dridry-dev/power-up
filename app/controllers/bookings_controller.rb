class BookingsController < ApplicationController
  before_action :set_presta, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.prestation = @prestation
    if @booking.save
      redirect_to prestation_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_presta
    @prestation = Prestation.find(params[:prestation_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :validation)
  end
end
