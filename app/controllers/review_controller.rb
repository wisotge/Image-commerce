class ReviewController < ApplicationController

  def index
    @review = Review.all
  end

  def create
    @review = Reveiw.create review_params
    redirect_to root_path
    if @review.save
      flash[:success] = "댓글을 등록하였습니다."
    else
      flash[:error] = "댓글을 등록하는데 실패하였습니다."
    end
    redirect_to root_path
  end

  private
  def review_params
    params.require(:review).permit(:review, :title, :reviewable_id, :reviewable_type, :user_id)
  end

end
