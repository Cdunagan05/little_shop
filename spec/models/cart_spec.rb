require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'can be initialized with contents' do
    cart = Cart.new({'1' => 1})

    expect(cart.contents).to eq( {'1' => 1} )
  end


end
