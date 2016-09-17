require 'rails_helper'

RSpec.feature 'Admin cannot modify users' do
  scenario 'they can edit their own account, but not users' do
#     As a logged in Admin
  user = User.create(username: 'admin', password: 'password', role: 1)
  login_user(user)
  user2 = User.create(username: 'bob', password: 'password', role: 0)

# I can modify my account data
  visit '/users/1/edit'

  fill_in 'Username', with: 'dog'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

  click_on 'Update User'

  expect(page).to have_content('Welcome dog')
  expect(page).to_not have_content('Welcome admin')

# But I cannot modify any other user's account data
  visit '/users/2/edit'

  fill_in 'Username', with: 'cat'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

  click_on 'Update User'

  expect(user2.username).to eq('bob')

  end
end
