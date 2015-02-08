class HomeController < AuthenticatedController
  layout 'main'

  def index
    @recipes = presentable(Recipe.includes(:image).limit(10))
  end
end
