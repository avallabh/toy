class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @restroom = Restroom.find(params[:restroom_id])
    @reviews = @restroom.reviews
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @user = current_user
    @restroom = Restroom.find(params[:restroom_id])
    @review = @restroom.reviews.build(review_params)
    if @review.save
      flash[:success] = 'Review added!'
      redirect_to "/restrooms/#{@restroom.id}"
    else
      flash[:alert] = 'Enter a valid review'
      render 'new'
    end
  end

  protected
  def review_params
    params.require(:review).permit(:cleanliness, :privacy, :smell, :accessibility, :gender, :comments, :user_id)
  end
end
