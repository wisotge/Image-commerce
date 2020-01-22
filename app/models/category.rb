class Category < ApplicationRecord

  has_many :image_items, dependent: :nullify
  
  def self.generate_categories
    %w(건축물 풍경 로고 자동차).each_with_index do |category_title, index|
      Category.create(title: category_title, position: index)
    end
  end
  
  def by_title category 
    category.title
  end
end
