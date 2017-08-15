class SearchController < AuthenticatedController

  def index
    recipes = Recipe.includes(:image).matching(params[:query]).page(params[:page]).per(48)
    @recipes = presentable(recipes)
  end

end
