class BoatsController < ApplicationController
  def index
  	@boats = Boat.all
  end

  def show
  	@boat = Boat.find(params[:id])
  end

  def new
  	if user_signed_in?
  	  @boat = Boat.new
  	else
  	  redirect_to new_user_session_path
  	end
  end

  def create
  	@boat = Boat.new(boat_params)
  	@boat.user = current_user
  	if @boat.save
  	  redirect_to boat_path(@boat.id)
  	else
  	  render :new
  	end
  end

  private

  def boat_params
  	params.require(:boat).permit(:name, :description, :location, :price_per_day)
  end
end
