class UsersController < ApplicationController
  
  def mypage
    @info_type = params[:type]
    @image_items = (@info_type == "upload") ? ImageItem.where(user_id: current_user.id) : current_user.orders.order("created_at DESC")
    @image_items = @image_items.page(params[:page]).per(5)
  end
  
  def add_balance
    current_user.chocomush += params.dig(:user, :chocomush).to_i
    current_user.save
    redirect_to main_paymodule_path
  end
  
end
