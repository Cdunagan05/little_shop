require 'rails_helper'

RSpec.feature 'Users can log out' do
  scenario 'a logged in user clicks logout and is logged out' do
    # As a user logged in,
    user = create :user
    login_user(user)
    # When I click 'Logout'
    click_link 'Logout'
    # Then I should see see 'Login'
    expect(page).to have_link 'Login'
    # And I should not see 'Logout'
    expect(page).to_not have_link 'Logout'
  end
end
