class ChangePriceToIntegerInImageItems < ActiveRecord::Migration[5.2]
  def change
    change_column :image_items, :price, 'integer USING CAST(price AS integer)'
  end
end
