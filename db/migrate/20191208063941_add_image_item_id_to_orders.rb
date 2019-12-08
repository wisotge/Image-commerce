class AddImageItemIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :image_item, foreign_key: true
  end
end
