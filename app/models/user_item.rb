class UserItem < ApplicationRecord
  belongs_to :image_item
  belongs_to :user
end
