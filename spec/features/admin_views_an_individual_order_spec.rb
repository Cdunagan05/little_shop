require 'rails_helper'

RSpec.feature 'Admin can view an individual order' do
  scenario 'Login as admin and view an order' do
#     As an authenticated Admin,
    admin = create :user, role: 1
    login_user(admin)
    billy = create :user, name: 'Billybob Thorton', address: '123 Fake St'
    order = create :order, user: billy
 # when I visit an individual order page
    visit '/orders/1'
# Then I can see the order's date and time.
    expect(page).to have_content(order.created_at)
# And I can see the purchaser's full name and address.
    expect(page).to have_content('Billybob Thorton')
    expect(page).to have_content('123 Fake St')
# And I can see, for each item on the order:
# - The item's name, which is linked to the item page.
# - Quantity in this order.
# - Price
# - Line item subtotal.
    expect(page).to have_link('Texas Jersey')
    expect(page).to have_content('Quantity 2')
    expect(page).to have_content(100.0)
    expect(page).to have_content(200.0)
# And I can see the total for the order.
    expect(page).to have_content(300.0)
# And I can see the status for the order.
    expect(page).to have_content('Status: Ordered')

  end
end
