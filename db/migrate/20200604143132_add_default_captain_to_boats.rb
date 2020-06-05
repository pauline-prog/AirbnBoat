class AddDefaultCaptainToBoats < ActiveRecord::Migration[6.0]
  def change
  	change_column_default :boats, :captain, false
  end
end
