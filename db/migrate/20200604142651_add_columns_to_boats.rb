class AddColumnsToBoats < ActiveRecord::Migration[6.0]
  def change
  	add_column :boats, :type, :string
  	add_column :boats, :captain, :boolean
  end
end
