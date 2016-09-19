require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'associations' do
    it { should have_many(:categories).through(:item_categories) }
    it { should have_many(:orders).through(:order_items) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:image) }
    it { should validate_uniqueness_of(:title) }
  end
end
