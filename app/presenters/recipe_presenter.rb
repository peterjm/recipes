class RecipePresenter < Presenter
  include HasImage

  alias_method :recipe, :element

  def self.model_name
    Recipe.model_name
  end

  def ingredient_lines
    IngredientLinePresenter.wrap(recipe.ingredient_lines, recipe)
  end
end
