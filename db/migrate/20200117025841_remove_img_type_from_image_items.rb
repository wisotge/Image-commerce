class RemoveImgTypeFromImageItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :image_items, :imgtype
  end
end
