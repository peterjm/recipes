class IngredientListParser
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def list
    @list ||= parse_ingredient_list
  end

  private

  def parse_ingredient_list
    @text.strip.lines.map(&:strip)
  end
end
