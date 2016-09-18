require 'rails_helper'

RSpec.feature 'Users can log in to their account' do
  scenario 'they visit root and log in' do
    user = create(:user)

    visit '/'
    expect(page).to have_link 'Login'

    click_link 'Login'
    expect(current_path).to eq '/login'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'

    expect(current_path).to eq '/dashboard'
    expect(page).to have_content 'Logged in as user'
    expect(page).to have_content 'Member since '
    expect(page).to_not have_link 'Login'
    expect(page).to have_link 'Logout'
  end
end
