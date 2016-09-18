class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(ordered paid cancelled completed)

  def subtotal_order_items(line_items)
    line_items.each do |item, quantity|
      items << item
      order_items.find_by(item_id: item.id).update_attribute(:subtotal,
        item.price * quantity
      )
    end
  end

  def total
    order_items.sum(:subtotal)
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
