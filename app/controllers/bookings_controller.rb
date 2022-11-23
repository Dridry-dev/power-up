class BookingsController < ApplicationController
  before_action :set_presta, except: %i[ destroy]
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @prestation = Prestation.find(params[:prestation_id])
    @booking = Booking.new
  end

  def create
    @prestation = Prestation.find(params[:prestation_id])
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
    @prestation = @booking.prestation
    if @booking.update(booking_params)
      redirect_to prestation_bookings_path(@prestation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @prestation = @booking.prestation
    @booking.destroy
    redirect_to prestation_bookings_path(@prestation)
  end

  private

  def set_presta
    @prestation = Prestation.find(params[:prestation_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :validation)
  end
end
