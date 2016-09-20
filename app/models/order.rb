class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(ordered paid cancelled completed)

  def subtotal_order_items(line_items)
    line_items.each do |item, quantity|
      items << item
      order_items.last.price = item.price
      order_items.last.quantity = quantity
    end
  end

  def total
    order_items.reduce(0) do |total, order_item|
      total += order_item.price * order_item.quantity
    end
  end

  def self.count_by_status(status)
    where(status: status).count
  end

  def self.all_by_status(status)
    if status == 'all'
      all
    else
      where(status: status)
    end
  end
end
