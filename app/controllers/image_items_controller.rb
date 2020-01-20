class ImageItemsController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :load_image_item, only: %i(show destroy edit toggle_set_line_item)

  def index
    #image_item에 카테고리별로 정렬하는 sort_images 정의
    @image_items = ImageItem.all
    @image_items = @image_items.where(category_id: params[:category_id]) if params[:category_id].present?
    @image_items = @image_items.sort_images(params[:type], params[:order]) if params[:type].present?
    @image_items = @image_items.page(params[:page]).per(9)
  end
  
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
    @reviews = Review.where(reviewable_id: @image_item.id).page(params[:page]).per(3)
  end

  def edit
    #업로드한 아이템 수정  
  end

  def destroy
    if Order.find_by(image_item_id: params[:id])
      flash[:error] = "삭제할 수 없는 이미지입니다."
    else
      @image_item.destroy
      flash[:success] = "성공적으로 이미지를 삭제하였습니다."
    end
    redirect_to mypage_user_path
  end

  def toggle_set_line_item
    #line item 생성/삭제, 이미지는 수량이 필요 없으므로 이미 장바구니에 있는 상품일 경우 삭제, 없는 상품일 경우는 생성
    line_item = (get_cart.image_items.include?(@image_item)) ? get_cart.line_items.find_by(image_item: @image_item).destroy : get_cart.line_items.create(price: @image_item.price, image_item: @image_item)
    line_item.set_order_total
  end

  private
  def load_image_item
    @image_item = ImageItem.find_by(id: params[:id])
  end

  private
  def image_item_params
    params.require(:image_item).permit(:title, :imgtype, :price, :repimg, :user_id, :description)
  end

  def line_item_params
    params.require(:line_item).permit(:price, :order_id, :image_item_id)
  end
end
