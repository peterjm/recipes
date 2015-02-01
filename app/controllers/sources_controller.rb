class SourcesController < SidebarController
  skip_before_filter :setup_sidebar, only: [:index]

  def show
    @source = presentable(Source.find(params[:id]))
    @recipes = presentable(@source.recipes)
  end
end
