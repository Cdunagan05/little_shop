require 'rails_helper'

RSpec.feature "Visitor can create and account" do
  scenario "they can visit login page and create an account" do
    # User.create(username: "User", password: "password")
    # As a visitor
    # When I visit "/login
    visit "/login"
    # And when I click link "Create Account"
    click_link "Create Account"
    # And I fill in my desired credentials
    fill_in "Username", with: "User"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    # And I submit my information
    click_button "Create Account"
    # Then my current page should be "/dashboard"
    expect(current_path).to eq("/dashboard")
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    expect(page).to have_content("Logged in as User")
    # And I should see my profile information
    expect(page).to have_content("User")
    # And I should not see a link for "Login"
    expect(page).to_not have_content("Login")
    # And I should see a link for "Logout"
    expect(page).to have_content("Logout")
  end
end
