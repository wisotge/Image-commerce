class AddPriceToImageItems < ActiveRecord::Migration[5.2]
  def change
    add_column :image_items, :price, :integer, default: 0
  end
end
