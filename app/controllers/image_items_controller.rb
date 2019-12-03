class ImageItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @image_item = ImageItem.all
  end

  def create
    @image_item = ImageItem.create image_item_params
    @image_item.save
  end

  def new
    @image_item = ImageItem.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def image_item_params
    params.require(:image_item).permit(:title, :repimg, :description, :price, :user_id)
  end
end
