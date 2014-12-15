class RecipesController < AuthenticatedController
  layout 'sidebar'
  respond_to :html

  def index
    @recipes = presentable(Recipe.all)
    respond_with @recipes, layout: 'main'
  end

  def show
    setup_sidebar
    @recipe = presentable(Recipe.find(params[:id]))
    @related_recipes = presentable(Recipe.all)
    respond_with @recipe
  end

  def new
    setup_sidebar
    @recipe = presentable(Recipe.new)
    respond_with @recipe
  end

  def create
    @recipe = presentable(Recipe.create(recipe_params))
    respond_with @recipe
  end

  def edit
    setup_sidebar
    @recipe = presentable(Recipe.find(params[:id]))
    respond_with @recipe
  end

  def update
    @recipe = presentable(Recipe.find(params[:id]))
    @recipe.update_attributes(recipe_params)
    respond_with @recipe
  end

  private

  def setup_sidebar
    @popular_recipes = presentable(Recipe.all)
  end

  def recipe_params
    params
      .require(:recipe)
      .permit(:title, :ingredients_text, :instructions_text, :source)
      .merge(update_recipe_ingredients_on_save: true)
  end

end
