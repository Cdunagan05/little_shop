require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'associations' do
    it {should have_many(:categories).through(:item_categories)}
    it {should have_many(:orders).through(:order_items)}
  end
end
