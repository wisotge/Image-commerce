class CreateImageItems < ActiveRecord::Migration[5.2]
  def change
    create_table :image_items do |t|
      t.string :title
      t.text :description
      t.string :price

      t.timestamps
    end
  end
end
