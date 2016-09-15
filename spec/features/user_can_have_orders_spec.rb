require 'rails_helper'

RSpec.feature 'User can have multiple orders' do
  scenario 'they visit /orders and see all their orders' do

  #   As an Authenticated User
  user = create :user
  login_user(user)

  # When I visit "/orders"
  visit '/orders'

  # Then I should see all orders belonging to me and no other orders
  expect(page).to have_content("My Orders")

  end
end
