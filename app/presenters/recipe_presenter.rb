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
    hexdigest = Digest::SHA1.hexdigest(recipe.title)
    number = (hexdigest.to_i(16) % RANDOM_IMAGE_COUNT) + 1
    "defaults/food/#{size}/#{number}.jpg"
  end
end
