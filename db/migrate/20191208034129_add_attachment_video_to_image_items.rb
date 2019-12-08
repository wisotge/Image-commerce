class AddAttachmentVideoToImageItems < ActiveRecord::Migration[5.2]
  def self.up
    change_table :image_items do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :image_items, :video
  end
end
