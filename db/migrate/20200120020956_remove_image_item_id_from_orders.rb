class RemoveImageItemIdFromOrders < ActiveRecord::Migration[5.2]
  def change
     remove_column :orders, :image_item_id
  end
end
