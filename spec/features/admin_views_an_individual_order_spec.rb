require 'rails_helper'

RSpec.feature 'Admin can view an individual order' do
  scenario 'Login as admin and view an order' do
    admin = create :user, role: 1
    login_user(admin)

    billy = create :user, name: 'Billybob Thorton', address: '123 Fake St'
    order = build :order, user: billy

    item1 = create :item
    item2 = create :item

    order.subtotal_order_items(item1 => 2, item2 => 1)
    order.save

    visit '/orders/8'

    expect(page).to have_content(order.created_at.to_formatted_s(:long))
    expect(page).to have_content('Billybob Thorton')
    expect(page).to have_content('123 Fake St')
    expect(page).to have_link('Jersey 7')

    within('tr:nth-child(2)') do
      within('td:nth-child(2)') do
        expect(page).to have_content('2')
      end
      within('td:nth-child(3)') do
        expect(page).to have_content(100.0)
      end
      within('td:nth-child(4)') do
        expect(page).to have_content(200.0)
      end
    end

    expect(page).to have_content('Total: $300.0')
    expect(page).to have_content('Status: Ordered')
  end
end
