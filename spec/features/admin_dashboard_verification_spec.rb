require 'rails_helper'

RSpec.feature 'Only admins have access to dashboard' do
  scenario 'an admin can see admin dashboard as admin' do
    create :user, role: 1, username: 'admin', password: 'password'

    visit '/login'

    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    expect(current_path).to eq '/admin/dashboard'
    expect(page).to have_content('Admin Dashboard')
  end

  scenario 'a user logs in and cannnot see admin dashboard' do
    user = create :user
    login_user(user)

    visit '/admin/dashboard'
    expect(page).to have_content('404')
  end

  scenario 'visitor cannot see admin dashboard' do
    visit '/admin/dashboard'

    expect(page).to have_content('404')
  end
end
