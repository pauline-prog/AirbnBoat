class PagesController < ApplicationController
  def home
  end

  def dashboard
  	@bookings = current_user.bookings
  	@boats = current_user.boats
  	@booking_request = Booking.where(boat_id: @boats.pluck(:id))
  end
end
