class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories

  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :image, presence: true

  enum status: %w(active retired)

  accepts_nested_attributes_for :categories
end
