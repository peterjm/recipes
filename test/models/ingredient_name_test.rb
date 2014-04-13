require 'test_helper'

class IngredientNameTest < ActiveSupport::TestCase
  test "is valid" do
    assert build(:ingredient_name).valid?, "should be valid"
  end

  test "isn't valid without name" do
    refute build(:ingredient_name, name: nil).valid?, "should not be valid"
  end

  test "requires the name to be unique" do
    ing = create(:ingredient)
    create(:ingredient_name, name: "tomatoes", ingredient: ing)
    refute build(:ingredient_name, name: "tomatoes", ingredient: ing).valid?, "should not be valid"
  end

  test ".find_ingredient finds an ingredient for the given name" do
    ing_name = create(:ingredient_name, name: "cheese")
    assert_equal ing_name.ingredient, IngredientName.find_ingredient("cheese")
  end

  test ".find_ingredient returns nil for an unknown ingredient" do
    assert_nil IngredientName.find_ingredient("unknown")
  end
end
