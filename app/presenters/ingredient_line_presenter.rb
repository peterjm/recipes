class IngredientLinePresenter < Presenter
  alias_method :ingredient_line, :element

  attr_reader :recipe

  def self.model_name
    raise "not applicable"
  end

  def initialize(element, recipe)
    super(element)
    @recipe = recipe
  end

  def description
    [quantity, style].compact.join(', ').presence
  end

  def linked_ingredient_list
    ingredient_links.to_sentence(two_words_connector: ' or ', last_word_connector: ' or ').html_safe
  end

  def ingredient_links
    names.map { |name|
      if ing = ingredient_for(name)
        helpers.link_to(ing.name, urls.ingredient_path(ing))
      else
        name
      end
    }
  end

  def quantity
    EyeOfNewt::Quantity.new(amount, unit, modifier: unit_modifier).to_s
  end

  def blank?
    !parsed? && line.blank?
  end

  def header?
    !parsed? && line.starts_with?('#')
  end

  def header
    line.sub(/^#+\s+/, '')
  end

  private

  def ingredient_for(name)
    recipe.recipe_ingredients.includes(:ingredient).named(name).try(:ingredient)
  end

end
