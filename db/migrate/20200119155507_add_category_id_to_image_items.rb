class AddCategoryIdToImageItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :image_items, :category, foreign_key: true
  end
end
