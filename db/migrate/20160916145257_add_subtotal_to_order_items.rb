class AddSubtotalToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :subtotal, :decimal
  end
end
