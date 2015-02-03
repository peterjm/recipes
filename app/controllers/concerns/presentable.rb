module Presentable
  extend ActiveSupport::Concern

  protected

  def presentable(resource, klass=presenter_class(resource))
    klass.wrap(resource)
  end

  def presenter_class(resource)
    Presenter.class_for(resource)
  end
end
