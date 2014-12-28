class RecipeIngredientPresenter < Presenter
  alias_method :recipe_ingredient, :element

  def self.model_name
    RecipeIngredient.model_name
  end

  def description
    [amount, style].compact.join(', ').presence
  end

  def fraction
    return nil if unit.nil? && quantity == 1
    fraction = quantity.to_r
    whole = fraction.to_i
    fraction -= whole
    [whole, fraction].reject(&:zero?).join(' ')
  end

  def amount
    [fraction, unit].compact.join(' ').presence
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

  def to_param
    ingredient.to_param
  end
end
