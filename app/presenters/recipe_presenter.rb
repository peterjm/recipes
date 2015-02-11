class RecipePresenter < Presenter
  include HasImage

  alias_method :recipe, :element

  def self.model_name
    Recipe.model_name
  end

  def ingredient_groups
    lines = IngredientLinePresenter.wrap(recipe.ingredient_lines, recipe).to_a
    groups = lines.each_with_index.each_with_object([[]]) do |(line, index), groups|
      groups << [] if index > 0 && !line.blank? && lines[index - 1].blank?
      groups.last << line
    end
    IngredientGroupPresenter.wrap(groups)
  end

  def images
    RecipeImagePresenter.wrap(recipe.images).to_a
  end

  def source
    SourcePresenter.wrap(recipe.source)
  end

  def dragonfly_image
    recipe.build_image unless recipe.image
    recipe.image.image
  end
end
