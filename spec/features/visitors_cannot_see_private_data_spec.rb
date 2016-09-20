require 'rails_helper'

RSpec.feature 'Visitors cannot see private data' do
  scenario 'unauthenticated user cannot see orders' do
    # As an Unauthenticated User
    order = create :order
    # I cannot view another user's private data, such as current order, etc.
    visit "/orders/#{order.id}"
    expect(page).to have_content('Must be logged in to view orders')
  end

  scenario 'unauthenticated user must login before checking out' do
    create :item
    visit '/'

    click_button 'Add to Cart'
    click_link 'View Cart'
    # I should be redirected to login/create account when I try to check out.
    expect(page).to_not have_button('Checkout')
    expect(page).to have_link('Login or Create Account to Checkout')

    click_link 'Login or Create Account to Checkout'
    expect(current_path).to eq('/login')
  end

  scenario 'unauthenticated users cannot view admin screens' do
    visit '/admin/dashboard'
    # I cannot view the administrator screens or use administrator functionality.
    expect(page).to have_content '404'
    # I cannot make myself an administrator.
    click_link 'Login'
    click_link 'Create Account'
    expect(page).to_not have_content 'Role'
  end
end
