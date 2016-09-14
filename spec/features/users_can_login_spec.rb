require 'rails_helper'

RSpec.feature 'Users can log in to their account' do
  scenario 'they visit root and log in' do
    create(:user)
    # As a visitor
    # When I visit '/'
    visit '/'
    # Then I should see a link for 'Login'
    expect(page).to have_link 'Login'
    # And when I click 'Login'
    click_link 'Login'
    # And I should be on the '/login' page
    expect(current_path).to eq '/login'
    # I should see a place to insert my credentials to login
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
    # And I fill in my desired credentials
    fill_in 'Username', with: 'User'
    fill_in 'Password', with: 'password'
    # And I submit my information
    click_button 'Login'
    # Then my current page should be '/dashboard'
    expect(current_path).to eq '/dashboard'
    # And I should see a message in the navbar that says 'Logged in as
    # SOME_USER'
    expect(page).to have_content 'Logged in as User'
    # And I should see my profile information
    expect(page).to have_content 'Member since '
    # And I should not see a link for 'Login'
    expect(page).to_not have_link 'Login'
    # And I should see a link for 'Logout'
    expect(page).to have_link 'Logout'
  end
end
