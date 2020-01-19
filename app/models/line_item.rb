class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :image_item
end
