class AddAcceptedFalseToBookings < ActiveRecord::Migration[6.0]
  def change
  	change_column_default :bookings, :accepted, false
  end
end
