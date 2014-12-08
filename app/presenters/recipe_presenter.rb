class RecipePresenter < Presenter
  alias_method :recipe, :element

  def recipe_ingredients
    RecipeIngredientPresenter.wrap(recipe.recipe_ingredients)
  end

  RANDOM_IMAGE_COUNT = 20
  def image(size)
    default_image(size)
  end

  def default_image(size)
    hex = Digest::SHA1.hexdigest(recipe.title).to_i(16)
    number = case size
    when '560x380'
      hex % 2 == 0 ? 8 : 21
    when '780x520'
      1
    else
      (hex % RANDOM_IMAGE_COUNT) + 1
    end
    "defaults/food/#{size}/#{number}.jpg"
  end
end
