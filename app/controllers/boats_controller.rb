class BoatsController < ApplicationController
  def index
    if params[:city_query].present? || params[:name_query].present?
      # sql_query = "location ILIKE :city_query OR name ILIKE :name_query"
      # @boats = Boat.where(sql_query, city_query: "%#{params[:city_query]}%", name_query: "%#{params[:name_query]}%")
      @boats = Boat.search_by_location_and_name([params[:city_query], params[:name_query]])
    else
      @boats = Boat.all
    end

    if params[:price_50].present?
      @boats = @boats.where("price_per_day <= ?", 50)
    end
    if params[:price_100].present?
      @boats = @boats.where("price_per_day >= ? and price_per_day <= ?", 50, 100)
    end
    if params[:price_200].present?
      @boats = @boats.where("price_per_day >= ? and price_per_day <= ?", 100, 200)
    end
    if params[:price_300].present?
      @boats = @boats.where("price_per_day >= ? and price_per_day <= ?", 200, 300)
    end
    if params[:price_400].present?
      @boats = @boats.where("price_per_day >= ? and price_per_day <= ?", 300, 400)
    end
    if params[:price_500].present?
      @boats = @boats.where("price_per_day >= ? and price_per_day <= ?", 400, 500)
    end
    if params[:price_more_than_500].present?
      @boats = @boats.where("price_per_day >= ?", 500)
    end
    if params[:category].present?
      @boats = @boats.where(category:params[:category])
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
  	params.require(:boat).permit(:name, :description, :location, :price_per_day, :photo, :category, :captain)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
