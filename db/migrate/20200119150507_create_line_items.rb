class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :order, foreign_key: true
      t.references :image_item, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
