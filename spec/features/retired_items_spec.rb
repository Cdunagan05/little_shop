require 'rails_helper'

RSpec.feature 'Retired items' do
  scenario '' do
    # As a user if I visit an item page and that item has been retired
    item = create :item, status: 1
    visit "/items/#{item.id}"
    # Then I should still be able to access the item page
    expect(page).to have_content item.title
    # And I should not be able to add the item to their cart
    expect(page).to_not have_button 'Add to Cart'
    # And I should see in place of the "Add to Cart" button or link - "Item Retired"
    expect(page).to have_content 'Item Retired'
  end
end
