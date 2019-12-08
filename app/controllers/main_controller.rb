class MainController < ApplicationController

  before_action :authenticate_user!

  def index
    sort_type = params[:type]
    if sort_type == "pay"
      @image_item = ImageItem.where(imgtype: "pay").page(params[:page]).per(9)
    elsif sort_type == "free"
      @image_item = ImageItem.where(imgtype: "free").page(params[:page]).per(9)
    elsif sort_type == "price"
      order = params[:order]
      if order == "high"
        @image_item = ImageItem.all.order("price DESC").page(params[:page]).per(9)
      else
        @image_item = ImageItem.all.order("price ASC").page(params[:page]).per(9)
      end
    elsif sort_type == "date"
      order = params[:order]
      if order == "recent"
        @image_item = ImageItem.all.order("created_at DESC").page(params[:page]).per(9)
      else
        @image_item = ImageItem.all.order("created_at ASC").page(params[:page]).per(9)
      end
    else
      @image_item = ImageItem.order("created_at DESC").page(params[:page]).per(9)
    end
  end

  def mypage
    @info_type = params[:type]
    if current_user.chocomush.nil?
      current_user.chocomush = 0
      current_user.save
    end

    if @info_type == "upload"
      @image_item = ImageItem.where(user_id: current_user.id).page(params[:page]).per(5)
    else
      @order_item = current_user.orders.order("created_at DESC").page(params[:page]).per(5)
    end
  end

  def charge
    @current_user = current_user
  end

  def addBalance
    chocomush = params[:user][:chocomush]
    current_user.chocomush += chocomush.to_i
    current_user.save
    redirect_to main_paymodule_path
  end

end
