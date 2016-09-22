require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'can be initialized with contents' do
    cart = Cart.new('1' => 1)

    expect(cart.contents).to eq('1' => 1)
  end

  it 'can add an item' do
    item = create :item
    cart = Cart.new

    expect{ cart.add_item(item.id) }.to change {
      cart.item_quantities
    }.from({}).to(item => 1)
  end

  it 'can remove an item' do
    item = create :item
    cart = Cart.new(item.id.to_s => 1)

    expect{ cart.remove_item(item.id) }.to change {
      cart.item_quantities
    }.from(item => 1).to({})
  end

  it 'calculates the total for the cart' do
    item = create :item, price: 100.0
    cart = Cart.new(item.id.to_s => 2)

    expect(cart.total).to eq (200.0)
  end

  it 'empties cart after checkout' do
    item = create :item
    cart = Cart.new(item.id.to_s => 2)

    expect{ cart.empty }.to change {
      cart.item_quantities
    }.from(item => 2).to({})
  end
end
