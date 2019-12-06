class ImageItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @image_item = ImageItem.all
  end

  def create
    @image_item = ImageItem.create image_item_params
    if @image_item.save
      flash[:success] = "성공적으로 이미지를 업로드하였습니다."
    else
      flash[:error] = "이미지를 업로드하는데 실패하였습니다."
    end
    redirect_to root_path
  end

  def new
    @image_item = ImageItem.new
  end

  def edit
  end

  def show
    @image_item = ImageItem.find(params[:id])
    @review = Review.new
    @rep_review = Review.where(reviewable_id: @image_item.id)
  end

  def update
  end

  def destroy
  end

  private
  def image_item_params
    params.require(:image_item).permit(:title, :imgtype, :price, :repimg, :user_id, :description)
  end
end
