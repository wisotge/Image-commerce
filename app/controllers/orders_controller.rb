class OrdersController < ApplicationController

  def create
    #as purchase function
    if current_user.orders.find_by(image_item_id: params[:id])
      flash[:notice] = "이미 구매하신 상품입니다."
    elsif
      order = Order.create(user_id: current_user.id, total: params[:chocomush])
      @image_item = ImageItem.find_by(id: params[:id])
      current_user.chocomush -= params[:chocomush].to_i
      order.image_item_id = @image_item.id
      if order.save
          @image_item.save
          current_user.save
          flash[:success] = "해당 상품을 구매하셨습니다."
      else
          flash[:error] = "해당 상품을 구매할 수 없습니다."
      end
    end
  end

end
