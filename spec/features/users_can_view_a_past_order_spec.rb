require 'rails_helper'

RSpec.feature 'User can view a past order' do
  scenario 'User has one past order' do
    item1, item2 = create_list(:item, 2)
    order = create :order_for_user, status: 3
    order.subtotal_order_items(item1 => 2, item2 => 3)

    login_user(order.user)
    visit '/orders'

    expect(page).to have_content 'Order number'
    expect(page).to have_link '3'

    click_link '3'

    expect(current_path).to eq('/orders/3')
    expect(page).to have_content'Jersey 7: $200.00'
    expect(page).to have_link(order.items.first.title)
    expect(page).to have_content(order.status)
    expect(page).to have_content 'Total: $500'
    expect(page).to have_content "Order placed on #{order.created_at}"
    expect(page).to have_content order.status
    expect(page).to have_content "Order #{order.status} on #{order.updated_at}"
  end
end
