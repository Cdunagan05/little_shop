require 'rails_helper'

RSpec.feature 'User can view a past order' do
  scenario 'User has one past order' do
    # As an authenticated user
    order = create :order_with_user_and_items
    login_user(order.user)
    # When I visit "/orders"
    visit '/orders'
    # Then I should see my past order
    expect(page).to have_content 'Order number'
    # And I should see a link to view that order
    expect(page).to have_link 'test'
    # And when I click that link
    click_link 'test'
    # Then I should see each item that was order with the quantity and
    # line-item subtotals

    # And I should see links to each item's show page
    # And I should see the current status of the order **(ordered, paid, cancelled, completed)**
    # And I should see the total price for the order
    # And I should see the date/time that the order was submitted
    # If the order was completed or cancelled
    # Then I should see a timestamp when the action took place
  end
end
