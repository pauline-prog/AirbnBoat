require 'date'

class BookingsController < ApplicationController
  def create
  	@booking = Booking.new(booking_params)
  	@booking.user = current_user
  	@booking.boat = Boat.find(params[:boat_id])
    if @booking.save
  	  redirect_to boat_path(params[:boat_id]), notice: "Votre réservation a bien été acceptée"
  	else
  	  redirect_to boat_path(params[:boat_id])
  	end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to dashboard_path
  end

  def update_destroy
    @booking = Booking.find(params[:id])
    @booking.canceled = true
    @booking.save
    redirect_to dashboard_path 
  end

  private

  def booking_params
  	params.require(:booking).permit(:start_date, :end_date)
  end
end
