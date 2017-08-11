class IngredientGroupPresenter < Presenter
  alias_method :ingredient_lines, :element

  def self.model_name
    raise "not applicable"
  end

  def header
    ingredient_lines.first.header if ingredient_lines&.first&.header?
  end

  def lines
    (header ? ingredient_lines[1..-1] : ingredient_lines).reject(&:blank?)
  end

end
