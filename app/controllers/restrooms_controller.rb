class RestroomsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @restrooms = Restroom.all
  end

  def new
    @restroom = Restroom.new
  end

  def show
    @restroom = Restroom.find(params[:id])
  end

  def create
    @restroom = Restroom.new(restroom_params)
    if @restroom.save
      redirect_to root_path, notice: 'Restroom added!'
    else
      render 'new'
    end
  end

  protected
  def restroom_params
    params.require(:restroom).permit(:latitude, :longitude, :location_name, :street_address, :city, :state, :zip)
  end
end
