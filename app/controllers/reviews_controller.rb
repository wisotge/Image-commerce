class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def create
    review = Review.create review_params
    (review.save) ? msg= "댓글을 등록하였습니다." : msg= "댓글을 등록하는데 실패하였습니다."
    redirect_to image_item_path(review.reviewable_id), notice: msg
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rate, :reviewable_id, :reviewable_type, :user_id)
  end

end
