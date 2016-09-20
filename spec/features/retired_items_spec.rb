require 'rails_helper'

RSpec.feature 'Retired items' do
  scenario '' do
    item = create :item, status: 1
    visit "/items/#{item.id}"

    expect(page).to have_content item.title
    expect(page).to_not have_button 'Add to Cart'
    expect(page).to have_button 'Item Retired', disabled: true
  end
end
