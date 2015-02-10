class IngredientListParser
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def lines
    @lines ||= parse_ingredient_lines
  end

  def ingredients
    @ingredients ||= lines.map do |line|
      begin
        ParsedIngredient.new(EyeOfNewt.parse(line))
      rescue EyeOfNewt::InvalidIngredient
        UnparsedIngredient.new(line)
      end
    end
  end

  private

  def parse_ingredient_lines
    @text.striplines.lines.map(&:strip)
  end

  class ParsedIngredient
    attr_reader :ing

    delegate :name, :style, :unit, :unit_modifier, :amount, :note, to: :ing

    def initialize(ing)
      @ing = ing
    end

    def parsed?
      true
    end
  end

  class UnparsedIngredient
    attr_reader :line

    def initialize(line)
      @line = line
    end

    def parsed?
      false
    end
  end
end
