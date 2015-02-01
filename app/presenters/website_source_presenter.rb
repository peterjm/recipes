class WebsiteSourcePresenter < Presenter
  alias_method :source, :element

  def self.model_name
    Source.model_name
  end

end
