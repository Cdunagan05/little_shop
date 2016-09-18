class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # validates :subtotal, presence: true
end
