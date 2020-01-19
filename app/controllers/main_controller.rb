class MainController < ApplicationController
  before_action :authenticate_user! #, except: %i(index)
  
  def index
    sort_type = params[:type]
    if sort_type
      @image_items = ImageItem.sort_images(sort_type, params[:order])
    else 
      @image_items = ImageItem.all.order("created_at DESC")
    end 
    @image_items = @image_items.page(params[:page]).per(9)
  end 
  
  def temp
    sort_type = params[:type]
    if ["pay", "free"].include?(sort_type)
      @image_items = (sort_type == "pay") ? ImageItem.pay_images : ImageItem.free_images
    elsif ["price", "created_at"].include?(sort_type)
      @image_items =  ImageItem.order("#{sort_type} #{params[:order] == "desc" ? "DESC" : "ASC"}")
    else 
      @image_items = ImageItem.all.order("created_at DESC")
    end 
    @image_items = @image_items.page(params[:page]).per(9)
  end

end
