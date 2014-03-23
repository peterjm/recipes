require 'test_helper'

class AuthenticationUseCasesTest < ActionDispatch::IntegrationTest
  test "create a new recipe" do
    log_in
    click_link "New Recipe"
    fill_in "Title", with: "Pizza"
    fill_in "Ingredients", with: "flour\ncheese"
    fill_in "Instructions", with: "make pizza"
    click_button "Bon Appetit!"

    assert page.has_content?("Pizza")
  end
end
