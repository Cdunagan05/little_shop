require 'rails_helper'

RSpec.feature 'Visitor can visit Item index' do
  scenario 'they can visit item index and see all existing items' do
    item = create :item
    visit '/items'

    expect(page).to have_content('All Items')
    expect(page).to have_content item.title
  end
end
