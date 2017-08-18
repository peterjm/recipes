class HomeController < AuthenticatedController
  layout 'main'

  def index
    @flagged_recipes = presentable(Recipe.flagged.includes(:image).page(params[:page]).per(48))
  end
end
