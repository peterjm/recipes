class SourcePresenter < Presenter
  include HasImage

  alias_method :source, :element
end
