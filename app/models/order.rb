class Order < ApplicationRecord
  belongs_to :user
  belongs_to :image_item
end
