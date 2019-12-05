class AddTypeToImageItems < ActiveRecord::Migration[5.2]
  def change
    add_column :image_items, :type, :string
  end
end
