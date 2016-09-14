require 'rails_helper'

RSpec.feature 'Visitor can visit Item index' do
  # let(:item) do
  #   Item.create(title: 'Broncos Jersey', description: 'This is a sweet Home
  # Broncs Jersey yo', price: 100.00)
  # end
  scenario 'they can visit item index and see all existing items' do
    item = create :item
    # As a visitor
    # When I visit '/items'
    visit '/items'
    # I can see all existing items
    expect(page).to have_content('All Items')
    expect(page).to have_content item.title
  end
end
