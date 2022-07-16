class TripsController < ApplicationController
  before_action :require_logged_in

  def index
    @trips = Trip.where(:user_id => current_user.id)
  end
  
  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.valid? 
      @trip.save!
      redirect_to @trip
    else
      render "new"
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update!(trip_params)
      redirect_to @trip
    else
      render "edit"
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:place_name, :date, :details, :image, :user_id)
  end

end
