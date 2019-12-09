class ReviewsController < ApplicationController

  def index
    @review = Review.all
  end

  def create
    @review = Review.create review_params
    if @review.save
      flash[:success] = "댓글을 등록하였습니다."
    else
      flash[:error] = "댓글을 등록하는데 실패하였습니다."
    end
    redirect_to image_item_path(@review.reviewable_id)
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rate, :reviewable_id, :reviewable_type, :user_id)
  end

end
