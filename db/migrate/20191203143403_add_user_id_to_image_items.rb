class AddUserIdToImageItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :image_items, :user, foreign_key: true
  end
end
