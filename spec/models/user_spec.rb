require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_uniqueness_of(:username)}
  end

  context 'associations' do
    it {should have_many(:orders)}
  end
end
