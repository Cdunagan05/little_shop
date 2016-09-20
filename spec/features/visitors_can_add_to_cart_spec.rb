require 'rails_helper'

RSpec.feature 'Visitors can add to cart' do
  scenario 'they can add an item to a cart' do
    item = create(:item)

    visit '/items'
    expect(page).to have_button('Add to Cart')

    click_button 'Add to Cart'
    click_link 'View Cart'

    expect(current_path).to eq('/cart')
    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content('$100.00')
    expect(page).to have_css('img[src="/images/image_url"]')
    expect(page).to have_content('Total: $100.00')
  end
end
