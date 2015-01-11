class RecipesController < SidebarController
  skip_before_filter :setup_sidebar, only: [:index]

  def index
    @recipes = presentable(Recipe.includes(:image).limit(4))
    render layout: 'main'
  end

  def show
    @recipe = presentable(Recipe.find(params[:id]))
    @related_recipes = presentable(Recipe.includes(:image).limit(3))
  end

  def new
    @recipe = presentable(new_recipe)
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe_path(recipe)
    else
      @recipe = presentable(recipe)
      render :new
    end
  end

  def edit
    @recipe = presentable(Recipe.find(params[:id]))
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update_attributes(recipe_params)
      redirect_to recipe_path(recipe)
    else
      @recipe = presentable(recipe)
      render :edit
    end
  end

  private

  def new_recipe
    if source = params[:source]
      Importer.import_from_url(source)
    else
      Recipe.new
    end
  end

  def recipe_params
    params
      .require(:recipe)
      .permit(
        :title,
        :ingredients_text,
        :instructions_text,
        :source,
        images_attributes: [:id, :remote_image_url, :image_data_uri, :_destroy]
      )
      .merge(update_recipe_ingredients_on_save: true, update_primary_image_on_save: true)
  end

end
