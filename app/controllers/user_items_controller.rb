class UserItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    UserItem.find_or_create_by(user_id: current_user.id, image_item_id: params[:image_item_id])
    flash[:success] = "찜 하였습니다!"
    redirect_to root_path
  end

  def destroy
    UserItem.find_by(user_id: current_user.id, image_item_id: params[:id]).destroy
    flash[:success] = "찜 해제하였습니다!"
    redirect_to root_path
  end
end
