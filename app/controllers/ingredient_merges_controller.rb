class IngredientMergesController < AuthenticatedController

  def create
    dest = Ingredient.find(params[:ingredient_id])
    src = Ingredient.find(params[:id])
    IngredientMerger.merge(dest, src)
    redirect_to dest
  end

end
