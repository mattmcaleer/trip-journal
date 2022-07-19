class PlacesController < ApplicationController
  before_action :require_logged_in

  def index
    @places = current_user.places
  end


  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place
    else
      render "new"
    end
  end
  
  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:country_name, :name)
  end

end