require 'rails_helper'

RSpec.feature 'User can have multiple orders' do
  scenario 'they visit /orders and see all their orders' do
    order = create :order_for_user
    other_order = create :order
    login_user(order.user)
    visit '/orders'

    expect(page).to have_content('My Orders')
    expect(page).to have_content("Order number #{order.id}")
    expect(page).to_not have_content("Order number #{other_order.id}")
  end
end
