require 'rails_helper'

RSpec.feature 'Visitor can view items by categories' do
  scenario 'they can visit category show page and see all items' do
    category = create :category_with_items

    visit "/#{category.name}"

    expect(page).to have_content category.items.first.title
  end

  scenario 'they can visit category show page and see all items' do
    category = create :category_with_items, name: 'Ohio State'
pending "Capybara doesn't like Ohio State"
    visit "/#{category.name}"

    expect(page).to have_content category.items.first.title
  end
end
