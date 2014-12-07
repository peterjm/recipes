module Presentable
  extend ActiveSupport::Concern

  protected

  def presentable(resource, klass=presenter_class(resource))
    klass.wrap(resource)
  end

  def presenter_class(resource)
    base_class = self.class.name.sub("Controller", "").singularize
    "#{base_class}Presenter".constantize
  end
end
