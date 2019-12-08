class AddStatusToImageItems < ActiveRecord::Migration[5.2]
  def change
    add_column :image_items, :status, :string
  end
end
