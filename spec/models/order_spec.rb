require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:items).through(:order_items) }
  end

  it { should define_enum_for(:status) }

  it 'creates order items for each item on the order' do
    item = create :item
    order = create :order_for_user
    expect { order.subtotal_order_items(item => 1) }.to change {
      OrderItem.all.count
    }.from(0).to(1)
  end

  it 'totals up subtotals from order items' do
    item = create :item
    order = build :order_for_user
    order.subtotal_order_items(item => 2)
    order.save

    expect(order.total).to eq(200)
  end
end
