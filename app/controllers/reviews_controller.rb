class ReviewsController < ApplicationController

  def index
    @review = Review.all
  end

  def create
    @review = Review.create review_params
    @review.save
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rate, :reviewable_id, :reviewable_type, :user_id)
  end

end
