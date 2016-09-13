class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :item_categories
  has_many :items, through: :item_categories

  # def to_param
  #   name
  # end


end
