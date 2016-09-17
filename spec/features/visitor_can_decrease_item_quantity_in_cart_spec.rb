require 'rails_helper'

RSpec.feature "Visitor can decrease Item quantity in cart" do
  scenario "they can decrease the item quantity of an existing item in cart" do
    create :item
    visit '/items'

    click_button 'Add to Cart'
  #  As a visitor
  #  When I visit "/cart"
  visit '/cart'
  #  Then I should see my item with a quantity of 1
  expect(page).to have_content('Number in cart: 1')
  #  And when I decrease the quantity
  fill_in 'cart_items[quantity]', with: 0
  click_on 'Update Item'
  #  Then my current page should be '/cart'
  expect(current_path).to eq('/cart')
  #  And that item's quantity should reflect the decrease
  expect(page).to have_content('Number in cart: 0')
  #  And the subtotal for that item should decrease
  expect(page).to have_content('Subtotal: $0')
  #  And the total for the cart should match that decrease
  expect(page).to have_content('Total: $0')
  end
end
