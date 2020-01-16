class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    sort_type = params[:type]
    if ["pay", "free"].include?(sort_type)
      @image_items =  ImageItem.where(imgtype: sort_type)
    elsif ["price", "created_at"].include?(sort_type)
      @image_items =  ImageItem.order("#{sort_type} #{params[:order] == "desc" ? "DESC" : "ASC"}")
    else 
      @image_items = ImageItem.all.order("created_at DESC")
    end 
    @image_items = @image_items.page(params[:page]).per(9)
  end

  def mypage
    @info_type = params[:type]
    @image_items = (@info_type == "upload") ? ImageItem.where(user_id: current_user.id) : current_user.orders.order("created_at DESC")
    @image_items = @image_items.page(params[:page]).per(5)
  end

  def addBalance
    current_user.chocomush += params.dig(:user, :chocomush).to_i
    current_user.save
    redirect_to main_paymodule_path
  end

end
