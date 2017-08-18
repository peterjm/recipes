class RecipeFlagsController < AuthenticatedController

  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe.create_flag! unless recipe.flag
    redirect_to recipe
  end

  def destroy
    recipe.flag&.destroy!
    redirect_to recipe
  end

  private

  def recipe
    recipe = Recipe.find(params[:recipe_id])
  end
end
