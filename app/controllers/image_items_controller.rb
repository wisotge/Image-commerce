class ImageItemsController < ApplicationController
  before_action :authenticate_user!

  def image_items
    @image_items = ImageItem.all
  end

  def create
    @image_item = (params[:image_item][:imgtype] == "pay") ? ImageItem.create pay_image_item_params : Image.create free_image_item_params
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

  def show
    @review = Review.new
    @rep_review = Review.where(reviewable_id: ImageItem.find(params[:id]).id).page(params[:page]).per(3)
  end

  def destroy
    @image_item = ImageItem.find(params[:id])
    if Order.find_by(image_item_id: @image_item.id)
      flash[:error] = "삭제할 수 없는 이미지입니다."
    else
      @image_item.destroy
      flash[:success] = "성공적으로 이미지를 삭제하였습니다."
    end
    redirect_to "main_mypage_path"
  end

  def add_video
    video = params[:video]
    image = image_item.find(params[:id])
    image.video.build(params[:video])
    image.save
  end

  private
  def pay_image_item_params
    params.require(:image_item).permit(:title, :imgtype, :price, :repimg, :user_id, :description)
  end

  def free_image_item_params
    params.require(:image_item).permit(:title, :imgtype, :repimg, :user_id, :description)
  end 

end
