require 'rails_helper'

RSpec.feature 'Visitor can view items by categories' do
  scenario 'they can visit category show page and see all items' do
    #   As a visitor
    category = create :category_with_items
    # When I visit '/:CATEGORY_NAME'
    visit "/#{category.name}"
    # I see all items assigned to that category
    expect(page).to have_content category.items.first.title
  end
end
