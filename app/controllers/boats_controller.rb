class BoatsController < ApplicationController
  def index
    if params[:city_query].present? || params[:name_query]
      # sql_query = "location ILIKE :city_query OR name ILIKE :name_query"
      # @boats = Boat.where(sql_query, city_query: "%#{params[:city_query]}%", name_query: "%#{params[:name_query]}%")
      @boats = Boat.search_by_location_and_name([params[:city_query], params[:name_query]])
    else
      @boats = Boat.all
    end
  end

  def show
  	@boat = Boat.find(params[:id])
    @booking = Booking.new
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

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path(@boat.id)
  end

  def destroy
    @boat.destroy
    redirect_to boats_path # A CHANGER POUR DASHBOARD
  end

  private

  def boat_params
  	params.require(:boat).permit(:name, :description, :location, :price_per_day, :photo)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
