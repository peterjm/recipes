class RecipeIngredientPresenter < Presenter
  alias_method :recipe_ingredient, :element

  def markdown
    text.sub(ingredient.name, linked_ingredient_name)
  end

  def standard_markdown
    [[amount, linked_ingredient_name].compact.join(' '), style].compact.join(", ")
  end

  def linked_ingredient_name
    "[#{ingredient.name}](#{ingredient_path})"
  end

  def fraction
    fraction = quantity.to_r
    whole = fraction.to_i
    fraction -= whole
    [whole, fraction].reject(&:zero?).join(' ')
  end

  def amount
    [fraction, unit].compact.join(' ')
  end

  def unit
    u = recipe_ingredient.unit
    return nil if u == "units"
    singular = quantity <= 1 && quantity.to_r.numerator == 1
    singular ? u.singularize : u
  end

  def ingredient_path
    urls.ingredient_path(recipe_ingredient.ingredient)
  end
end
