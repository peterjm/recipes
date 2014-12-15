class IngredientPresenter < Presenter
  alias_method :ingredient, :element

  def <=>(other)
    ingredient.name <=> other.ingredient.name
  end

  def first_letter
    ingredient.name[0].upcase
  end

  def recipes
    presentable(ingredient.recipes)
  end
end
