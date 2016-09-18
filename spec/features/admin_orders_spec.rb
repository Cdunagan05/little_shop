require 'rails_helper'

RSpec.feature 'Admin has access to orders from dashboard' do
  scenario 'Admin can visit dashboard and see all orders' do
    create :order_for_user
    create :order_for_user

    user = create :user, role: 1
    login_user(user)

    expect(page).to have_content('Order number 1')
    expect(page).to have_content('Ordered 2')
    expect(page).to have_link('Order number 1')
  end

  scenario 'admin can filter orders by status' do
    create :order_for_user, status: 1
    create :order_for_user, status: 0
    user = create :user, role: 1
    login_user(user)

    expect(page).to have_button('filter_status')
    expect(page).to have_content('Order number 3')

    within '.dropdown-menu' do
      click_on 'Ordered'
    end

    expect(page).to have_content('Order number 4')
    expect(page).to_not have_content('Order number 3')
  end

  scenario 'admin can change the status of orders from the dashboard' do
    order = create :order_for_user
    create :order_for_user, status: 1
    create :order_for_user, status: 2

    user = create :user, role: 1
    login_user(user)

    within '.order5' do
      expect(page).to have_link('Cancel')
      expect(page).to have_link('Mark as paid')
      expect(page).to_not have_link('Mark as completed')

      click_link 'Cancel'
      order.reload
      expect(order.status).to eq('cancelled')
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
  end
end
