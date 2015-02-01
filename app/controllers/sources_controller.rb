class SourcesController < SidebarController
  def index
    @sources = presentable(Source.all)
  end

  def show
    @source = presentable(Source.find(params[:id]))
    @recipes = presentable(@source.recipes)
  end

  def edit
    @source = presentable(Source.find(params[:id]))
  end

  def update
    source = Source.find(params[:id])
    if source.update_attributes(source_params)
      redirect_to source_path(source)
    else
      @source = source
      render :edit
    end
  end

  private

  def source_params
    params.require(:source).permit(:name, :type, :author, :url)
  end

end