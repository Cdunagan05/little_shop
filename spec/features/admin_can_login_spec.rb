require 'rails_helper'

RSpec.feature 'Admin can log in' do
  scenario 'they log in and see admin dashboard' do
#   As an Admin
  User.create(username: 'admin', password: 'password', role: 1)
# When I log in
  visit '/login'

  fill_in 'Username', with: 'admin'
  fill_in 'Password', with: 'password'
  click_button 'Login'
# Then I am redirected to "/admin/dashboard"
  expect(current_path).to eq '/admin/dashboard'
  end
end
