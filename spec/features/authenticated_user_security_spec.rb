require 'rails_helper'

RSpec.feature 'Authenticated user security' do
  scenario 'Users cannot view other users private data' do
    user = create :user
    other_user = create :user
    login_user(user)

    visit user_path(other_user)
    expect(page).to have_content('Users can only view their own dashboard')

    item = create :item
    order = build :order, user: other_user
    order.subtotal_order_items(item => 2)
    order.save

    visit order_path(order)
    expect(page).to have_content('Users can only view their own orders')

    visit admin_dashboard_path
    expect(page).to have_content('Flag on the play! Out of bounds')

    visit edit_user_path(user)
    expect(page).to_not have_content('Role')
  end
end
