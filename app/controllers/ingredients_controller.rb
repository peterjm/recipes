class IngredientsController < AuthenticatedController
  include Resourceful

  resource :ingredient, presenter: IngredientPresenter

  respond_to :html

  def show
    respond_with Ingredient.find(params[:id])
  end

end
