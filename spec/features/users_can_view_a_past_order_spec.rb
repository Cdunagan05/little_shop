require 'rails_helper'

RSpec.feature 'User can view a past order' do
  scenario 'User has one past order' do
    pending "Only check status if status is cancelled or completed" 
    # As an authenticated user
    item1, item2 = create_list(:item, 2)
    order = create :order_for_user
    order.set_items({ item1 => 2, item2 => 3 })
    login_user(order.user)
    # When I visit '/orders'
    visit '/orders'
    # Then I should see my past order
    expect(page).to have_content 'Order number'
    # And I should see a link to view that order
    expect(page).to have_link '3'
    # And when I click that link
    click_link '3'
    # Then I should see each item that was order with the quantity and
    expect(current_path).to eq('/orders/3')
    # line-item subtotals
    expect(page).to have_content'Jersey 7: $200.00'
    # And I should see links to each item's show page
    expect(page).to have_link(order.items.first.title)
    # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    expect(page).to have_content(order.status)
    # And I should see the total price for the order
    expect(page).to have_content 'Total: $500'
    # And I should see the date/time that the order was submitted
    expect(page).to have_content "Order placed on #{order.created_at.to_s}"
    # If the order was completed or cancelled
    expect(page).to have_content order.status
    # Then I should see a timestamp when the action took place
    expect(page).to have_content "Order #{order.status} on #{order.updated_at.to_s}"
  end
end
