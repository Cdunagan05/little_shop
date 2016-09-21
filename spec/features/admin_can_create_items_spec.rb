require 'rails_helper'

RSpec.feature 'Admin can create item' do
  scenario 'admin creates an item' do
    admin = create :user, role: 1
    login_user(admin)

    click_on 'Create item'

    expect(current_path).to eq('/admin/items/new')

    fill_in 'Title', with: 'Purdue Jersey'
    fill_in 'Description', with: 'This is a sweet Boilermaker Jersey'
    fill_in 'Price', with: 75.00
    fill_in 'Category', with: 'Purdue'
    fill_in 'Image', with: 'Image url'

    expect { click_on 'Create Item' }.to change { Item.all.count }.from(0).to(1)
    expect(current_path).to eq('/items/1')

    visit '/Purdue'

    expect(page).to have_content('Purdue')
  end
end
