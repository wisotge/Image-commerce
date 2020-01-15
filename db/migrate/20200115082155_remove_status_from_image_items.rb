class RemoveStatusFromImageItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :image_items, :status
  end
end
