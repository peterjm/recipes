class IngredientsController < AuthenticatedController
  respond_to :html

  def show
    @ingredient = presentable(Ingredient.find(params[:id]))
    respond_with @ingredient
  end

end
