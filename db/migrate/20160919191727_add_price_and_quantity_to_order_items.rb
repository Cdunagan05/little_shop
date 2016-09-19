class AddPriceAndQuantityToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :price, :decimal
    add_column :order_items, :quantity, :integer

    remove_column :order_items, :subtotal, :decimal
  end
end
