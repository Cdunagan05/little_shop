require 'rails_helper'

RSpec.feature 'Visitor can decrease Item quantity in cart' do
  scenario 'they can decrease the item quantity of an existing item in cart' do
    create :item
    visit '/items'

    click_button 'Add to Cart'

    visit '/cart'
    expect(page).to have_content('Number in cart: 1')

    fill_in 'cart_items[quantity]', with: 0
    click_on 'Update Item'

    expect(current_path).to eq('/cart')
    expect(page).to have_content('Number in cart: 0')
    expect(page).to have_content('Subtotal: $0')
    expect(page).to have_content('Total: $0')
  end
end
