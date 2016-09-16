require 'rails_helper'

RSpec.feature 'User can view a past order' do
  scenario 'User has one past order' do
    # As an authenticated user
    order = create :order_with_user_and_items
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
save_and_open_page
    # And I should see links to each item's show page
    expect(page).to have_link(order.items.first.title)
    # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    # And I should see the total price for the order
    # And I should see the date/time that the order was submitted
    # If the order was completed or cancelled
    # Then I should see a timestamp when the action took place
  end
end
