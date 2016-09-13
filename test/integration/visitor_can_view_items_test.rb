require 'test_helper'

class VisitorCanViewItemsTest < ActionDispatch::IntegrationTest

  test "visitors can view items by visiting /items" do
    visit '/items'

    assert page.has_content?("All Items")
  end
end
