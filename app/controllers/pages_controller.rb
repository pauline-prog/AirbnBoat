class PagesController < ApplicationController
  def home
  end

  def dashboard
  	@bookings = Booking.where(user: current_user)
  end
end
