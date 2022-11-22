class Clients::BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def edit
  end

  def update
  end
end
