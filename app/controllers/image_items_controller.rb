class ImageItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    if ImageItem.create image_item_params
      flash[:success] = "성공적으로 이미지를 업로드하였습니다."
    else
      flash[:error] = "이미지를 업로드하는데 실패하였습니다."
    end
    redirect_to root_path
  end

  def new
    @image_item = ImageItem.new
  end

  def show
    @image_item = ImageItem.find_by(id: params[:id]) 
    @reviews = Review.where(reviewable_id: @image_item.id).page(params[:page]).per(3)
  end

  def destroy
    if Order.find_by(image_item_id: params[:id])
      flash[:error] = "삭제할 수 없는 이미지입니다."
    else
      ImageItem.find_by(id: params[:id]).destroy
      flash[:success] = "성공적으로 이미지를 삭제하였습니다."
    end
    redirect_to main_mypage_path
  end

  private
  def image_item_params
    params.require(:image_item).permit(:title, :imgtype, :price, :repimg, :user_id, :description)
  end

end
