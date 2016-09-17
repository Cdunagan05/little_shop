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
  save_and_open_page
  expect(page).to have_content('Admin Dashboard')
  end
end
