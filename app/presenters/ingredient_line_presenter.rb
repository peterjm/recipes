class IngredientLinePresenter < Presenter
  alias_method :ingredient_line, :element

  attr_reader :recipe

  def self.model_name
    raise "no applicable"
  end

  def initialize(element, recipe)
    super(element)
    @recipe = recipe
  end

  def description
    [quantity, style].compact.join(', ').presence
  end

  def notes
  end

  def ingredient
    recipe.recipe_ingredients.includes(:ingredient).named(name).ingredient
  end

  def ingredient_path
    urls.ingredient_path(ingredient)
  end

  def to_param
    ingredient.to_param
  end

  private

  def rational_amount
    @r ||= amount.rationalize(0.1)
  end

  def fraction
    return nil if unit.nil? && amount == 1
    fraction = rational_amount
    whole = fraction.to_i
    fraction -= whole
    [whole, fraction].reject(&:zero?).join(' ')
  end

  def quantity
    [fraction, unit].compact.join(' ').presence
  end

  def unit
    u = ingredient_line.unit
    return nil if u == "units"
    singular = amount <= 1 && rational_amount.numerator == 1
    singular ? u.singularize : u
  end

end
