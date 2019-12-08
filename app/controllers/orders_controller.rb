class OrdersController < ApplicationController

  def create
    #as purchase function
    order = Order.create(:user_id => current_user.id, :total => params[:chocomush])
    deduction_chocomush = params[:chocomush]
    @image_item = ImageItem.find(params[:id])
    @image_item.status += 1
    current_user.chocomush = current_user.chocomush - deduction_chocomush.to_i
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
