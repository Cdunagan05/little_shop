class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories

  has_many :order_items
  has_many :orders, through: :order_items
end
