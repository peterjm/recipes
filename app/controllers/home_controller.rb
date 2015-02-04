class HomeController < AuthenticatedController
  layout 'main'

  def index
    @recipes = presentable(Recipe.includes(:image).limit(4))
  end
end
