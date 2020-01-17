class OrdersController < ApplicationController

  def create
    current_user.orders.create_with(total: params[:chocomush]).find_or_create_by(user_id: current_user.id, image_item_id: params[:id]) do |order|
      order.user.chocomush -= params[:chocomush].to_i
      if order.user.save
        flash[:success] = "상품을 구매하였습니다."
      end 
    end 
    flash[:error] = "이미 구매하신 상품입니다."
  end

end
