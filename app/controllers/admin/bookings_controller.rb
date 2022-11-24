class Admin::BookingsController < ApplicationController
  before_action :set_booking, only: :update

  def index
    @bookings = current_user.bookings
    @pendings = Booking.where(validation: 0)
    @validates = Booking.where(validation: 1)
    @refuseds = Booking.where(validation: 2)
  end

  def update
    if params[:validation] == "1"
      @booking.validation = "validated"
    else
      @booking.validation = "refused"
    end
    if @booking.update(validation: @booking.validation)
      redirect_to admin_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
