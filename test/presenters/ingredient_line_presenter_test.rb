require 'test_helper'

class IngredientLinePresenterTest < ActiveSupport::TestCase

  test "#ingredient_path is the path to the ingredient" do
    ing = Ingredient.from("tomatoes")
    ing.save!
    ing.ingredient_names.create(name: "tomato")
    recipe = create(:recipe, ingredients_text: "1 tomato, sliced", update_recipe_ingredients_on_save: true)
    p = IngredientLinePresenter.new(recipe.ingredient_lines.first, recipe)
    assert_equal "/ingredients/1-tomatoes", p.ingredient_path
  end

end
