require 'test_helper'

class AuthenticationUseCasesTest < ActionDispatch::IntegrationTest
  test "create a new recipe" do
    log_in
    click_link "New recipe"
    fill_in "Title", with: "Pizza"
    fill_in "Ingredients", with: "flour\ncheese"
    fill_in "Instructions", with: "make pizza"
    click_button "Submit"

    assert page.has_content?("Pizza")
  end

  test "edit a recipe" do
    r = create(:recipe, title: "Pizza", update_recipe_ingredients_on_save: true)
    log_in
    visit recipe_path(r)
    click_link "Edit"
    fill_in "Title", with: "Not Pizza"
    click_button "Submit"

    assert page.has_content?("Not Pizza")
  end
end
