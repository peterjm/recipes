class SourcesController < SidebarController
  def index
    @sources = presentable(Source.all)
  end

  def show
    @source = presentable(Source.find(params[:id]))
    @recipes = presentable(@source.recipes)
  end
end
