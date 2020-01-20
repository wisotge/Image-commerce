class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :image_item, optional: true

  #line_item 추가될때 마다 자동으로 cart order의 total 변경
  #after_save :set_order_total

  def set_order_total
    order.update(total: order.line_items.sum("price"))
  end
end
