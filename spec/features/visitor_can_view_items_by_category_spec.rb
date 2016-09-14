require 'rails_helper'

RSpec.feature "Visitor can view items by categories" do
  scenario "they can visit category show page and see all items" do
  #   As a visitor
  # When I visit "/:CATEGORY_NAME"
  # I see all items assigned to that category

  category = Category.create(name: 'jersies')
  category.items.create(title: 'Texas Jersey', description: 'This is a sweet Longhorn Jersey yo', price: 100.00)



  visit '/jersies'

  expect(page).to have_content('Texas Jersey')
  end
end
