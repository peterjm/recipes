class RecipeIngredientPresenter < Presenter
  alias_method :recipe_ingredient, :element

  def markdown
    text.sub(ingredient.name, "[#{ingredient.name}](#{ingredient_path})")
  end

  def ingredient_path
    urls.ingredient_path(recipe_ingredient.ingredient)
  end
end
