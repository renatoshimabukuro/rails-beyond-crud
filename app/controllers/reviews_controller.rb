class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @review.restaurant_id = @restaurant.id
    @review.restaurant = @restaurant
    if @review.save
      # It worked, it save
      redirect_to restaurant_path(@restaurant)
    else
      # It didn't save due to validation errors
      # Show the user they made a mistake
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
