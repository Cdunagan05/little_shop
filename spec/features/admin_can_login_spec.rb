require 'rails_helper'

RSpec.feature 'Admin can log in' do
  scenario 'they log in and see admin dashboard' do
    create :user, role: 1, username: 'admin', password: 'password'
    visit '/login'

    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    expect(current_path).to eq '/admin/dashboard'
  end
end
