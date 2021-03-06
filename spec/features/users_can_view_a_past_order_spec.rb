require 'rails_helper'

RSpec.feature 'User can view a past order' do
  scenario 'User has one past order' do
    item1, item2 = create_list(:item, 2)
    order = build :order_for_user, status: 3
    order.subtotal_order_items(item1 => 2, item2 => 3)
    order.save

    login_user(order.user)
    visit '/orders'

    expect(page).to have_content 'Order number'
    expect(page).to have_link order.id

    click_link order.id

    expect(current_path).to eq("/orders/#{order.id}")
    within('tr:nth-child(2)') do
      within('td:first') do
        expect(page).to have_content 'Jersey 13'
      end
      within('td:nth-child(4)') do
        expect(page).to have_content '$200.00'
      end
    end
    expect(page).to have_link(order.items.first.title)
    expect(page).to have_content order.status
    expect(page).to have_content 'Total: $500'
    expect(page).to have_content(
      "Order placed on #{order.created_at.to_formatted_s(:long)}"
    )
    expect(page).to have_content order.status
    expect(page).to have_content(
      "Order #{order.status} on #{order.updated_at.to_formatted_s(:long)}"
    )
  end
end
