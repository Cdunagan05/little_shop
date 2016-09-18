require 'rails_helper'

RSpec.feature 'Visitors can remove items from carts' do
  scenario 'visitor views cart and removes an item' do
    create :item, title: 'Texas Jersey'

    visit '/items'
    click_button 'Add to Cart'

    visit '/cart'
    click_link 'Remove'

    expect(current_path).to eq('/cart')
    expect(page).to have_css('div.text-success')
    expect(page).to have_content(
      'Successfully removed Texas Jersey from your cart')
    expect(page).to have_link 'Texas Jersey'
    within 'div#cart' do
      expect(page).to_not have_content('Texas Jersey')
    end
  end
end
