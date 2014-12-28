class IngredientsController < SidebarController

  def index
    @ingredients = presentable(Ingredient.all)
  end

  def show
    @ingredient = presentable(Ingredient.find(params[:id]))
  end

end
