class BookingsController < ApplicationController
  def new
  	@booking = Booking.new
  end

  def create
  	@booking = Booking.new(booking_params)
  	@booking.user = current_user
  	@booking.boat = params[:boat_id]
  	if @booking.save
  	  redirect_to boat_path(params[:boat_id])
  	else
  	  redirect_to boat_path(params[:boat_id])
  	end
  end

  private

  def booking_params
  	params.require(:booking).permit(:start_date, :end_date)
  end
end
