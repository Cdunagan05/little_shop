require 'rails_helper'

RSpec.feature 'Visitor can increase item quantity in cart' do
  scenario 'they can increase an items quantity in cart' do
    create :item

    visit '/items'
    click_button 'Add to Cart'

    visit '/cart'
    expect(page).to have_content('Number in cart: 1')

    fill_in 'cart_items[quantity]', with: 2
    click_on 'Update Item'

    expect(current_path).to eq('/cart')
    expect(page).to have_content('Number in cart: 2')
    expect(page).to have_content('Subtotal: $200')
    expect(page).to have_content('Total: $200')
  end
end
