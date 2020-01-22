class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :line_items, dependent: :destroy
  has_many :image_items, through: :line_items

  enum status: %i(cart paid)

  scope :paid_orders, -> {where(status: :paid)}
  # enum status: [:cart, :paid]

  def order_summary
    result =  "#{self.image_items.first.title} 항목 외 #{self.image_items.count - 1}건"
    "#{result}"
  end
end
