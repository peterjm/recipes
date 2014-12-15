module Presentable
  extend ActiveSupport::Concern

  protected

  def presentable(resource, klass=presenter_class(resource))
    klass.wrap(resource)
  end

  def presenter_class(resource)
    base_class = if resource.respond_to?(:klass)
      resource.klass.name
    else
      resource.class.name
    end
    "#{base_class}Presenter".constantize
  end
end
