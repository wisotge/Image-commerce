class MainController < ApplicationController
  before_action :authenticate_user! #, except: %i(index)
  
  def index
    #image_item에 카테고리별로 정렬하는 sort_images 정의
    sort_type = params[:type]
    if sort_type
      @image_items = ImageItem.sort_images(sort_type, params[:order])
    else 
      @image_items = ImageItem.all.order("created_at DESC")
    end 
    @image_items = @image_items.page(params[:page]).per(9)
  end 

end
