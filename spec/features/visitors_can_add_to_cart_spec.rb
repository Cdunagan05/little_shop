require 'rails_helper'

RSpec.feature 'Visitors can add to cart' do
  scenario 'they can add an item to a cart' do
  #  As a visitor
  # When I visit any page with an item on it
  # I should see a link or button for 'Add to Cart'
  # When I click 'Add to cart' for that item
  # And I click a link or button to view cart
  # And my current path should be '/cart'
  # And I should see a small image, title, description and price for the item I just added
  # And there should be a 'total' price for the cart that should be the sum of all items in the cart

  create(:item)

  visit '/items'

  expect(page).to have_button('Add to Cart')

  click_button 'Add to Cart'
  click_link 'View Cart'

  expect(current_path).to eq('/cart')

  expect(page).to have_content('Texas Jersey')
  expect(page).to have_content('This is a cool Longhorn jersey')
  expect(page).to have_content('$100.00')
  expect(page).to have_css('img[src="image_url"]')

  expect(page).to have_content('Total: $100.00')
   end
end
