require 'rails_helper'

RSpec.feature 'Only admins have access to dashboard' do
  scenario 'they can see admin dashboard as admin' do
#     As an Admin
  User.create(username: 'admin', password: 'password', role: 1)

  visit '/login'

  fill_in 'Username', with: 'admin'
  fill_in 'Password', with: 'password'
  click_button 'Login'

# When I visit "/admin/dashboard"
  expect(current_path).to eq '/admin/dashboard'
# I will see a heading on the page that says "Admin Dashboard"
  expect(page).to have_content('Admin Dashboard')
  end

  scenario 'they log in and cannnot see admin dashboard' do
    # As a registered user
    user = create :user
    login_user(user)
    #  When I visit "/admin/dashboard"
    visit '/admin/dashboard'
    # save_and_open_page
    #  I get a 404
    expect(page).to have_content('404')
  end

  scenario 'visitor cannot see admin dashboard' do
    #   As an unregistered user
    # When I visit "/admin/dashboard"
    visit '/admin/dashboard'
    # I get a 404
    expect(page).to have_content('404')
  end
end
