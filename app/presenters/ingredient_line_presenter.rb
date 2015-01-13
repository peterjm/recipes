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

  def ingredient
    recipe.recipe_ingredients.includes(:ingredient).named(name).ingredient
  end

  def ingredient_path
    urls.ingredient_path(ingredient)
  end

  def to_param
    ingredient.to_param
  end

  def quantity
    EyeOfNewt::Quantity.new(amount, unit).to_s
  end

end
