require 'rails_helper'

RSpec.feature 'Visitors have carts' do
  scenario 'a visitor adds items and views the cart' do
    # As a visitor when I have items in my cart
    create :item, title: 'Texas Jersey'
    visit '/items'
    click_button 'Add to Cart'
    # session[:cart] = create_a_cart_with_items([item_1, item_2])
    # And when I visit '/cart'
    visit '/cart'
    # I should not see an option to 'Checkout'
    expect(page).to_not have_button 'Checkout'
    # I should see an option to 'Login or Create Account to Checkout'
    expect(page).to have_link 'Login or Create Account to Checkout'
    # After I create an account
    user = create :user
    login_user(user)
    # And I visit '/cart
    visit '/cart'
    # Then I should see all of the data that was there when I was not logged in
    expect(page).to have_button 'Checkout'
    expect(page).to have_content 'Texas Jersey'
  end
end