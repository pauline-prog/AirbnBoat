class PagesController < ApplicationController
  def home
  	@user = current_user
  end

  def dashboard
  	@bookings = current_user.bookings
  	@boats = current_user.boats
  	@booking_request = Booking.where(boat_id: @boats.pluck(:id))
  end

  def log_in_sign_up
  end
end
