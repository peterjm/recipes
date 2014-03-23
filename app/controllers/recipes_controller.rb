class RecipesController < AuthenticatedController

  respond_to :html

  def index
    @recipes = Recipe.all
    respond_with @recipes
  end

  def new
    @recipe = Recipe.new
    respond_with @recipe
  end

  def create
    recipe_params = params.require(:recipe)
                          .permit(:title, :ingredients_text, :instructions_text, :source)
    @recipe = Recipe.create(recipe_params)
    respond_with @recipe
  end

end
