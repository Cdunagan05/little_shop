require 'rails_helper'

RSpec.feature 'Checking out' do
  scenario 'as an unauthenticated user' do
    # As a visitor
    create :item
    visit '/'
    # When I add items to my cart
    click_button 'Add to Cart'
    # And I visit '/cart'
    visit 'cart'
    # And I click 'Login or Register to Checkout'
    click_link 'Login or Create Account to Checkout'
    # Then I should be required to login
    expect(current_path).to eq('/login')
  end

  scenario 'as an authenticated users' do
    # When I am logged in
    user = create :user
    login_user(user)
    create :item
    visit '/'
    click_button 'Add to Cart'
    # And I visit my cart
    visit '/cart'
    # And when I click 'Checkout'
    # Then the order should be placed
    expect { click_button 'Checkout' }.to change {
      Order.all.count
    }.from(0).to(1)
    # And my current page should be '/orders'
    expect(current_path).to eq '/orders'
    # And I should see a message 'Order was successfully placed'
    expect(page).to have_content 'Order was successfully placed'
    # And I should see the order I just placed in a table
    expect(page).to have_content 'Order number 10'
  end
end
