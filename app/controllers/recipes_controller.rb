class RecipesController < AuthenticatedController

  respond_to :html

  def index
    @recipes = Recipe.all
    respond_with @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    respond_with @recipe
  end

  def new
    @recipe = Recipe.new
    respond_with @recipe
  end

  def create
    @recipe = Recipe.create(recipe_params)
    respond_with @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
    respond_with @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(recipe_params)
    respond_with @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients_text, :instructions_text, :source)
  end

end
