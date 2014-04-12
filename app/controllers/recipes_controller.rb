class RecipesController < AuthenticatedController
  include Resourceful
  resource :recipe

  respond_to :html

  def index
    respond_with Recipe.all
  end

  def show
    respond_with Recipe.find(params[:id])
  end

  def new
    respond_with Recipe.new
  end

  def create
    respond_with Recipe.create(recipe_params)
  end

  def edit
    respond_with Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(recipe_params)
    respond_with recipe
  end

  private

  def recipe_params
    params
      .require(:recipe)
      .permit(:title, :ingredients_text, :instructions_text, :source)
      .merge(update_recipe_ingredients_on_save: true)
  end

end
