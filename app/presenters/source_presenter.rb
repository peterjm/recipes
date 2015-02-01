class SourcePresenter < Presenter
  alias_method :source, :element

  def self.new(element, *args)
    if self == SourcePresenter
      Presenter.class_for(element).new(element, *args)
    else
      super
    end
  end

  def self.model_name
    Source.model_name
  end
end
