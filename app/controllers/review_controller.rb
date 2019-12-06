class ReviewController < ApplicationController

  def index
    @review = Review.all
  end

  def create
    @review = Reveiw.create review_params
    @review.save
  end

  private
  def review_params
    params.require(:review).permit(:review, :title, :reviewable_id, :reviewable_type, :user_id)
  end

end
