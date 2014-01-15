class RestroomsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create] # , :show

  def index
    @restrooms = Restroom.all
    @restroom = Restroom.new
  end

  def show
    @restroom = Restroom.find(params[:id])
  end

  def create
    @restroom = Restroom.new(restroom_params)
    if @restroom.save
      flash[:success] = 'Restroom added!'
      redirect_to root_path
    else
      flash[:alert] = 'Place a valid marker'
      redirect_to root_path
    end
  end

  protected
  def restroom_params
    params.require(:restroom).permit(:latitude, :longitude, :location_name, :street_address, :city, :state, :zip)
  end
end
