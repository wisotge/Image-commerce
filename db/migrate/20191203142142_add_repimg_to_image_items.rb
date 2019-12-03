class AddRepimgToImageItems < ActiveRecord::Migration[5.2]
  def change
    add_column :image_items, :repimg, :string
  end
end
