class ImageItemsController < ApplicationController
  before_action :authenticate_user! 
  before_action :load_image_item, only: %i(show destroy edit toggle_set_line_item toggle_set_user_item)
  before_action :check_owner, only: %i(edit destroy toggle_set_line_item)

  def index
    @image_items = ImageItem.all
    @image_items = @image_items.where(category_id: params[:category_id]) if params[:category_id].present? #카테고리 별로 정렬
    @image_items = @image_items.sort_images(params[:type], params[:order]) if params[:type].present? #원하는 컬럼 별로 정렬
    @image_items = @image_items.ransack(title_or_description_cont: params[:q]).result(distinct: true) if params[:q].present? #검색된 상품 
    @image_items = @image_items.page(params[:page]).per(9)
  end
  
  def create
    ImageItem.create image_item_params
    redirect_to root_path, notice: "성공적으로 이미지를 업로드하였습니다."
  end

  def new
    @image_item = ImageItem.new
    @category = Category.all
  end

  def show
    @reviews = Review.where(reviewable_id: @image_item.id).page(params[:page]).per(4)
  end

  def destroy
    @image_item.destroy if @authorization
    redirect_back fallback_location: root_path, notice: "상품을 삭제하였습니다."
  end

  def toggle_set_line_item
    #line item 생성/삭제, 이미지는 수량이 필요 없으므로 이미 장바구니에 있는 상품일 경우 삭제, 없는 상품일 경우는 생성
    if !@authorization
      line_item = (get_cart.image_items.include?(@image_item)) ? get_cart.line_items.find_by(image_item: @image_item).destroy : get_cart.line_items.create(price: @image_item.price, image_item: @image_item) 
      line_item.set_order_total
    else
      msg = "자신의 상품은 구매할 수 없습니다."
    end 
    redirect_back fallback_location: root_path, notice: msg 
  end

  def toggle_set_user_item
    #user item(wishlist) 생성/삭제
    (current_user.user_items.where(image_item: @image_item).first) ? current_user.user_items.where(image_item: @image_item).first.destroy : current_user.user_items.where(image_item: @image_item).create
    redirect_back fallback_location: root_path
  end

  private
  def load_image_item
    @image_item = ImageItem.find_by(id: params[:id])
  end

  private
  def image_item_params
    params.require(:image_item).permit(:title, :imgtype, :price, :repimg, :user_id, :description, :category_id)
  end

  def check_owner
    @authorization = (@image_item.user == current_user) ? true : false 
  end
end
