class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :item_categories
  has_many :items, through: :item_categories

  def to_param
    name.gsub(' ', '-')
  end

  def self.find_by_name(param_name)
    find_by(name: param_name.gsub('-', ' '))
  end
end
