class RestroomsController < ApplicationController
  def index
    @restrooms = Restroom.all
  end

  def new
    @restroom = Restroom.new
  end
end
