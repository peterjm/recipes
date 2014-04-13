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

  test ".build_from sets attributes from a parsed ingredient" do
    ri = RecipeIngredient.build_from("1 tomato, sliced")
    assert_equal 1, ri.quantity
    assert_equal "tomato", ri.name
  end

  test ".build_from will save the ingredient when it saves the recipe ingredient" do
    r = create(:recipe)
    assert_difference "RecipeIngredient.count", 1 do
      assert_difference "Ingredient.count", 1 do
        ri = r.recipe_ingredients.build_from("1 tomato, sliced").tap(&:save!)
        assert_equal r, ri.recipe
      end
    end
  end
end
