require 'rails_helper'

RSpec.feature 'Authenticated user security' do
  scenario 'Users cannot view other users private data' do
    # As an Authenticated User
    user = create :user
    other_user = create :user
    login_user(user)
    # I cannot view another user's private data (current or past orders, etc)
    visit user_path(other_user)
    expect(page).to have_content("Users can only view their own dashboard")

    item = create :item
    order = create :order, user: other_user
    order.subtotal_order_items(item => 2)

    visit order_path(order)
    #error message
    # I cannot view the administrator screens or use admin functionality
    visit admin_dashboard_path
    #error message
    # I cannot make myself an admin
    visit edit_user_path(user)
    expect(page).to_not have_content("Role")
  end
end
