class RecipePresenter < Presenter
  alias_method :recipe, :element

  def ingredients_markdown
    text = recipe.ingredients_text.dup
    recipe_ingredients.each do |ing|
      text.gsub!(ing.text, ing.standard_markdown)
    end
    text
  end

  def recipe_ingredients
    RecipeIngredientPresenter.wrap(recipe.recipe_ingredients)
  end
end
