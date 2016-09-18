require 'rails_helper'

RSpec.feature 'Users can log out' do
  scenario 'a logged in user clicks logout and is logged out' do
    user = create :user
    login_user(user)

    click_link 'Logout'

    expect(page).to have_link 'Login'
    expect(page).to_not have_link 'Logout'
  end
end
