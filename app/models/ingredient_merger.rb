class IngredientMerger
  def self.merge(dest, src)
    new.merge(dest, src)
  end

  def merge(dest, src)
    return if dest == src

    src.recipe_ingredients.update_all(ingredient_id: dest.id)
    src.ingredient_names.update_all(ingredient_id: dest.id)
    src.destroy
  end
end
