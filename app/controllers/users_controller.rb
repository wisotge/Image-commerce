class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    case @info_type = params[:type]
    when "upload" then @image_items = current_user.image_items
    when "cart" then @image_items = get_cart.image_items
    when "paid" then @image_items = ImageItem.joins(line_items: :order).where(orders: {status: 1, user_id: current_user.id}) #결제한 상품들을 출력하기 위해 join 메서드 사용
    else @image_items = current_user.wishlist 
    end
    @image_items = @image_items.page(params[:page]).per(5)
  end
  
  def update
    current_user.set_chocomush("charge", params.dig(:user, :chocomush).to_i)
    redirect_to root_path, notice: "충전이 완료되었습니다."
  end
  
end
