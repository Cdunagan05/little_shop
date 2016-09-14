require 'rails_helper'

RSpec.feature 'Visitors can remove items from carts' do
  scenario 'visitor views cart and removes an item' do
    # As a visitor
    create :item, title: 'Texas Jersey'
    visit '/items'
    click_button 'Add to Cart'
    # When I visit "/cart"
    visit '/cart'
    # And I click link "Remove"
    click_link 'Remove'
    # Then my current page should be "/cart"
    expect(current_path).to eq('/cart')
    # And I should see a message styled in green
    expect(page).to have_css('div.text-success')
    # And the message should say "Successfully removed SOME_ITEM from your
    # cart."
    expect(page).to have_content(
      'Successfully removed Texas Jersey from your cart')
    # And the title "SOME_ITEM" should be a link to that item in case the user
    # wants to add it back
    expect(page).to have_link 'Texas Jersey'
    # And I should not see the item listed in cart
    within 'div#cart' do
      expect(page).to_not have_content('Texas Jersey')
    end
  end
end
