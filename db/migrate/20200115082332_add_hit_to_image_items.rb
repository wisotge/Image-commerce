class AddHitToImageItems < ActiveRecord::Migration[5.2]
  def change
    add_column :image_items, :hit, :integer, default: 0
  end
end
