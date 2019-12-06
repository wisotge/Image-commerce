class MainController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @image_item = ImageItem.order("created_at DESC").page(params[:page]).per(9)
  end

  def sort
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
    else
      order = params[:order]
      if order == "recent"
        @image_item = ImageItem.all.order("created_at DESC").page(params[:page]).per(9)
      else
        @image_item = ImageItem.all.order("created_at ASC").page(params[:page]).per(9)
      end
    end
  end

  def mypage
  end
end
