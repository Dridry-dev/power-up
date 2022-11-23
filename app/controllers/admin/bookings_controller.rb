class Admin::BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def edit
    @bookings = Booking.find(params[:id])
  end

  def update
    @bookings = Booking.find(params[:id])
    @boookings.update(booking_params)
    redirect_to booking_path(@bookings)
  end

  private

  def booking_params
    params.require(:booking).permit(:validation)
  end
end
