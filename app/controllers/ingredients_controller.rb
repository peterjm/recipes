class IngredientsController < AuthenticatedController
  respond_to :html

  def show
    @ingredient = presenter(Ingredient.find(params[:id]))
    respond_with @ingredient
  end

end
