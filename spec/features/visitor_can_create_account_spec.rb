require 'rails_helper'

RSpec.feature 'Visitor can create an account' do
  scenario 'they can visit login page and create an account' do
    visit '/login'
    click_link 'Create Account'

    fill_in 'Username', with: 'User'
    fill_in 'Name', with: 'Bob'
    fill_in 'Address', with: '3309 Edgemont'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Logged in as User')
    expect(page).to have_content('User')
    expect(page).to_not have_link('Login')
    expect(page).to have_link('Logout')
  end
end
