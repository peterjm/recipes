require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "is valid" do
    assert build(:recipe).valid?, "should be valid"
  end

  test "isn't valid without title" do
    refute build(:recipe, title: nil).valid?, "should not be valid"
  end

  test "#update_recipe_ingredients creates new ingredients" do
    recipe = build(:recipe, ingredients_text: "1 cup flour\n1 cup milk")
    recipe.update_recipe_ingredients
    assert_equal 2, recipe.recipe_ingredients.length
    assert_equal "1 cup flour", recipe.recipe_ingredients[0].text
    assert_equal "1 cup milk", recipe.recipe_ingredients[1].text
  end

  test "#update_recipe_ingredients is idempotent" do
    recipe = build(:recipe, ingredients_text: "1 cup flour\n1 cup milk")
    recipe.update_recipe_ingredients
    recipe.update_recipe_ingredients
    assert_equal 2, recipe.recipe_ingredients.length
    assert_equal "1 cup flour", recipe.recipe_ingredients[0].text
    assert_equal "1 cup milk", recipe.recipe_ingredients[1].text
  end

  test "#update_recipe_ingredients removes no-longer used ingredients" do
    recipe = build(:recipe, ingredients_text: "1 cup flour\n1 cup milk")
    recipe.update_recipe_ingredients
    recipe.ingredients_text = "1 cup flour\n1 cup soy milk"
    recipe.update_recipe_ingredients
    assert_equal 2, recipe.recipe_ingredients.length
    assert_equal "1 cup flour", recipe.recipe_ingredients[0].text
    assert_equal "1 cup soy milk", recipe.recipe_ingredients[1].text
  end
end
