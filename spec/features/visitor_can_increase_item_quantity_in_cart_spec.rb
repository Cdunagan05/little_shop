require 'rails_helper'

RSpec.feature "Visitor can increase item quantity in cart" do
  scenario "they can increase an items quantity in cart" do
    # As a visitor
    # When I visit "/cart"
    visit '/cart'
    # Then I should see my item with a quantity of 1
    expect(page).to have_content('quantity 1')
    # And when I increase the quantity
    fill_in :quantity, with: 2
    # Then my current page should be '/cart'
    expect(current_path).to eq('/cart')
    # And that item's quantity should reflect the increase
    expect(page).to have_content('quantity 2')
    # And the subtotal for that item should increase
    expect(page).to have_content('Item Subtotal: $200')
    # And the total for the cart should match that increase
    expect(page).to have_content('Total: $300')
  end
end
