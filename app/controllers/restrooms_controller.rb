class RestroomsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @restrooms = Restroom.all
  end

  def new
    @restroom = Restroom.new
  end
end
