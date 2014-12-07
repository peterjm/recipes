class RecipePresenter < Presenter
  alias_method :recipe, :element

  def ingredients_markdown
    text = recipe.ingredients_text.dup
    recipe_ingredients.each do |ing|
      text.gsub!(ing.text, ing.standard_markdown)
    end
    text
  end

  def recipe_ingredients
    RecipeIngredientPresenter.wrap(recipe.recipe_ingredients)
  end

  RANDOM_IMAGE_COUNT = 20
  def image(size)
    default_image(size)
  end

  def default_image(size)
    hex = Digest::SHA1.hexdigest(recipe.title).to_i(16)
    number = if size == '560x380'
      hex % 2 == 0 ? 8 : 21
    else
      (hex % RANDOM_IMAGE_COUNT) + 1
    end
    "defaults/food/#{size}/#{number}.jpg"
  end
end
