class RecipePresenter < Presenter
  attr_reader :recipe

  def initialize(recipe)
    super
    @recipe = recipe
  end
end
