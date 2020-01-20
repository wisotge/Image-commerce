class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order, only: %i(show edit update destroy)
  #before_action :check_owner, only: %(new)

  def index 
    @orders = current_user.orders.paid.order(:paid_at).page(params[:page]).per(5)
  end 

  def new 
    #장바구니 페이지, 상품 구매시 create로 order 생성 
    @order = get_cart
  end

  def create
    image_item = ImageItem.find_by(id: params[:id])
    if current_user.image_items.include?(image_item)
      flash[:error] = "구매할 수 없는 상품입니다."
    else 
      current_user.orders.create_with(total: params[:chocomush].to_i).find_or_create_by(image_item: image_item) do |order|
        order.user.set_chocomush("purchase", params[:chocomush].to_i)
        if order.user.save
          flash[:success] = "상품을 구매하였습니다."
        end 
      end 
      flash[:error] = "이미 구매하신 상품입니다."
    end 
  end

  def edit
  end
  
  def update
    @order.paid!
    @order.update(paid_at: Time.now)
    redirect_to users_path
  end

  private
  def load_order
    @order = Order.find_by(id: params[:id])
  end

  def check_owner
    redirect_to root_path, notice: "권한없음 " unless @order.user == current_user
  end
end
