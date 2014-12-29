class SidebarController < AuthenticatedController
  layout 'sidebar'

  before_action :setup_sidebar

  protected

  def setup_sidebar
    @popular_recipes = presentable(Recipe.all)
  end
end