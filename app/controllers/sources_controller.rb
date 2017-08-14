class SourcesController < AuthenticatedController
  def index
    @sources = presentable(Source.page(params[:page]).per(48))
  end

  def show
    @source = presentable(Source.find(params[:id]))
    @recipes = presentable(@source.recipes.page(params[:page]).per(48))
  end

  def new
    @source = presentable(Source.new)
  end

  def create
    source = Source.new(source_params)
    if source.save
      redirect_to source_path(source)
    else
      @source = presentable(source)
      render :new
    end
  end

  def edit
    @source = presentable(Source.find(params[:id]))
  end

  def update
    source = Source.find(params[:id])
    if source.update_attributes(source_params)
      redirect_to source_path(source)
    else
      @source = presentable(source)
      render :edit
    end
  end

  private

  def source_params
    params
      .require(:source)
      .permit(
        :name,
        :source_type,
        :author,
        :url,
        :description,
        :image_url,
        :image_data_uri,
        :remove_image
      )
  end

end
