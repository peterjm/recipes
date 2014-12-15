class IngredientsController < SidebarController
  respond_to :html

  def index
    @ingredients = presentable(Ingredient.all)
    respond_with @ingredients
  end

  def show
    @ingredient = presentable(Ingredient.find(params[:id]))
    respond_with @ingredient
  end

end
