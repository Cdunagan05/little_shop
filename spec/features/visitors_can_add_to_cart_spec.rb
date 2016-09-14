require 'rails_helper'

RSpec.feature 'Visitors can add to cart' do
  scenario 'they can add an item to a cart' do
    #  As a visitor
    # When I visit any page with an item on it
    item = create(:item)
    visit '/items'
    # I should see a link or button for 'Add to Cart'
    expect(page).to have_button('Add to Cart')
    # When I click 'Add to cart' for that item
    click_button 'Add to Cart'
    # And I click a link or button to view cart
    click_link 'View Cart'
    # And my current path should be '/cart'
    expect(current_path).to eq('/cart')
    # And I should see a small image, title, description and price for the
    # item I just added
    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content('$100.00')
    expect(page).to have_css('img[src="image_url"]')
    # And there should be a 'total' price for the cart that should be the sum
    # of all items in the cart
    expect(page).to have_content('Total: $100.00')
  end
end
