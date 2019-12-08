class ChangeStatusToIntegerInImageItems < ActiveRecord::Migration[5.2]
  def change
    change_column :image_items, :status, 'integer USING CAST(price AS integer)'
  end
end
