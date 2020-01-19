class Order < ApplicationRecord
  belongs_to :user
  belongs_to :image_item

  enum status: %i(cart, paid)
end
