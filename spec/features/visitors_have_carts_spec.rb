require 'rails_helper'

RSpec.feature 'Visitors have carts' do
  scenario 'a visitor adds items and views the cart' do
    create :item, title: 'Texas Jersey'

    visit '/items'
    click_button 'Add to Cart'

    visit '/cart'
    expect(page).to_not have_button 'Checkout'
    expect(page).to have_link 'Login or Create Account to Checkout'

    user = create :user
    login_user(user)

    visit '/cart'
    expect(page).to have_button 'Checkout'
    expect(page).to have_content 'Texas Jersey'
  end
end
