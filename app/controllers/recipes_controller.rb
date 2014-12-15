class RecipesController < SidebarController
  respond_to :html

  skip_before_filter :setup_sidebar, only: [:index]

  def index
    @recipes = presentable(Recipe.all)
    respond_with @recipes, layout: 'main'
  end

  def show
    @recipe = presentable(Recipe.find(params[:id]))
    @related_recipes = presentable(Recipe.all)
    respond_with @recipe
  end

  def new
    @recipe = presentable(Recipe.new)
    respond_with @recipe
  end

  def create
    @recipe = presentable(Recipe.create(recipe_params))
    respond_with @recipe
  end

  def edit
    @recipe = presentable(Recipe.find(params[:id]))
    respond_with @recipe
  end

  def update
    @recipe = presentable(Recipe.find(params[:id]))
    @recipe.update_attributes(recipe_params)
    respond_with @recipe
  end

  private

  def recipe_params
    params
      .require(:recipe)
      .permit(:title, :ingredients_text, :instructions_text, :source)
      .merge(update_recipe_ingredients_on_save: true)
  end

end
