require 'rails_helper'

RSpec.feature 'Admin cannot modify users' do
  scenario 'they can edit their own account, but not users' do
    user = create :user, role: 1
    login_user(user)

    visit edit_user_path(user)

    fill_in 'Username', with: 'dog'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Update User'

    expect(page).to have_content('Welcome dog')
    expect(page).to_not have_content('Welcome admin')
  end

  scenario 'they cannot edit a different users account data' do
    user = create :user, role: 1
    login_user(user)
    user2 = create :user, username: 'bob'

    visit edit_user_path(user2)

    fill_in 'Username', with: 'cat'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Update User'

    expect(user2.username).to eq('bob')
  end
end
