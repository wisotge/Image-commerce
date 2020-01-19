class MainController < ApplicationController
  before_action :authenticate_user! #, except: %i(index)
  
  def index
    #image_item에 카테고리별로 정렬하는 sort_images 정의
    @image_items = ImageItem.all
    @image_items = @image_items.where(category_id: params[:category_id]) if params[:category_id].present?
    @image_items = @image_items.sort_images(params[:type], params[:order]) if params[:type].present?
    @image_items = @image_items.page(params[:page]).per(9)
  end 

end
