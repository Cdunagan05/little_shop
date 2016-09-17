require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  context 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:category) }
  end
end
