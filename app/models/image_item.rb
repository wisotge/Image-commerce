class ImageItem < ApplicationRecord
  mount_uploader :repimg, ImageUploader

  belongs_to :user, optional:true
end
