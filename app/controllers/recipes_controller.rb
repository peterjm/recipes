class RecipesController < SidebarController
  skip_before_filter :setup_sidebar, only: [:index]

  def index
    @recipes = presentable(Recipe.all)
    render layout: 'main'
  end

  def show
    @recipe = presentable(Recipe.find(params[:id]))
    @related_recipes = presentable(Recipe.all)
  end

  def new
    @recipe = presentable(Recipe.new)
  end

  def create
    @recipe = presentable(Recipe.create(recipe_params))
    if @recipe.persisted?
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = presentable(Recipe.find(params[:id]))
  end

  def update
    @recipe = presentable(Recipe.find(params[:id]))
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params
      .require(:recipe)
      .permit(:title, :ingredients_text, :instructions_text, :source)
      .merge(update_recipe_ingredients_on_save: true)
  end

end
