class UsersController < ApplicationController
  
  def mypage
    @info_type = params[:type]
    @image_items = (@info_type == "upload") ? ImageItem.where(user_id: current_user.id) : current_user.orders.order("created_at DESC")
    @image_items = @image_items.page(params[:page]).per(5)
  end
  
  def edit 
  end

  def update
    current_user.set_chocomush("charge", params.dig(:user, :chocomush).to_i)
    redirect_to root_path, notice: "충전이 완료되었습니다."
  end
  
end
