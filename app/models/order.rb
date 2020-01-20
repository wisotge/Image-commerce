class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :line_items, dependent: :destroy
  has_many :image_items, through: :line_items

  enum status: %i(cart paid)

  scope :paid_orders, -> {where(status: :paid)}
  # enum status: [:cart, :paid]
end
