class IngredientParser

  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def name
    "tomatoes"
  end

  def quantity
    "1 cup"
  end

  def style
    "diced"
  end

end
