class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order, only: %(show edit update delete)

  def create
    image_item = ImageItem.find_by(id: params[:id])
    if current_user.image_items.include?(image_item)
      flash[:error] = "구매할 수 없는 상품입니다."
    else 
      current_user.orders.create_with(total: params[:chocomush].to_i).find_or_create_by(image_item: image_item) do |order|
        order.user.chocomush -= params[:chocomush].to_i
        if order.user.save
          flash[:success] = "상품을 구매하였습니다."
        end 
      end 
      flash[:error] = "이미 구매하신 상품입니다."
    end 
  end

  private
  def load_order
    @order = Order.find_by(id: params[:id])
  end

end
