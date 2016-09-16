class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  enum status: %W[ordered paid cancelled completed]

  def set_items(line_items)
    line_items.each do |item, quantity|
      items<<(item)
      order_items.find_by(item_id:item.id).update_attribute(:subtotal, item.price * quantity)
    end
  end

  def total
    order_items.sum(:subtotal)
  end
end
