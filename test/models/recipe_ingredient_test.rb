require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  test "is valid" do
    assert build(:recipe_ingredient).valid?, "should be valid"
  end

  test "requires text" do
    refute build(:recipe_ingredient, text: nil).valid?, "should not be valid"
  end

  test "requires a recipe" do
    refute build(:recipe_ingredient, recipe: nil).valid?, "should not be valid"
  end

  test "requires quantity" do
    refute build(:recipe_ingredient, quantity: nil).valid?, "should not be valid"
  end

  test "requires a unit" do
    refute build(:recipe_ingredient, unit: nil).valid?, "should not be valid"
  end

  test "requires that unit is recognized" do
    refute build(:recipe_ingredient, unit: "asdf").valid?, "should not be valid"
  end
end
