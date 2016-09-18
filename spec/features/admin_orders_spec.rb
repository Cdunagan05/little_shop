require 'rails_helper'

RSpec.feature 'Admin has access to orders from dashboard' do
  scenario 'Admin can visit dashboard and see all orders' do
    #   As an Admin
    # When I visit the dashboard
    order1 = create :order_for_user
    order2 = create :order_for_user
    user = create :user, role: 1
    login_user(user)
    # Then I can see a listing of all orders

    expect(page).to have_content('Order number 1')
    # And I can see the total number of orders for each status **("Ordered", "Paid", "Cancelled", "Completed")**
    expect(page).to have_content('Ordered 2')
    # And I can see a link for each individual order
    expect(page).to have_link('Order number 1')
  end

  scenario 'admin can filter orders by status' do
    order1 = create :order_for_user, status: 1
    order2 = create :order_for_user, status: 0
    user = create :user, role: 1
    login_user(user)
    # And I can filter orders to display by each status type  **("Ordered", "Paid", "Cancelled", "Completed")**
    expect(page).to have_button('filter_status')
    expect(page).to have_content('Order number 3')
    within '.dropdown-menu' do
      click_on 'Ordered'
    end
    expect(page).to have_content('Order number 4')
    expect(page).to_not have_content('Order number 3')
    # , options: ['All', 'Ordered', 'Paid', 'Cancelled', 'Completed'])
  end

  scenario 'admin can change the status of orders from the dashboard' do
    order1 = create :order_for_user
    order2 = create :order_for_user, status: 1
    order2 = create :order_for_user, status: 2

    user = create :user, role: 1
    login_user(user)
    # And I have links to transition between statuses
    within '.order5' do
      expect(page).to have_link('Cancel')
      expect(page).to have_link('Mark as paid')
      expect(page).to_not have_link('Mark as completed')
    end

    within '.order6' do
      expect(page).to have_link('Cancel')
      expect(page).to_not have_link('Mark as paid')
      expect(page).to have_link('Mark as completed')
    end

    within '.order7' do
      expect(page).to_not have_link('Cancel')
      expect(page).to_not have_link('Mark as paid')
      expect(page).to_not have_link('Mark as completed')
    end
    #   - I can click on "cancel" on individual orders which are "paid" or "ordered"
    #   - I can click on "mark as paid" on orders that are "ordered"
    #   - I can click on "mark as completed" on orders that are "paid"
  end
end
