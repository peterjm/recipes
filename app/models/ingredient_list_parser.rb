class IngredientListParser
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def ingredient_lines
    @lines ||= parse_ingredient_lines
  end

  private

  def parse_ingredient_lines
    @text.lines.map(&:strip).reject(&:blank?)
  end
end
