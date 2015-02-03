class Presenter
  extend Forwardable
  include Presentable

  def_delegators :element, :to_param

  def self.wrap(element_or_elements, *args)
    if element_or_elements.respond_to?(:each)
      MultiplePresenter.new(element_or_elements, self, *args)
    else
      new(element_or_elements, *args)
    end
  end

  def self.class_for(resource)
    base_class = if resource.respond_to?(:klass)
      resource.klass.name
    else
      resource.class.name
    end
    "#{base_class}Presenter".constantize
  end

  attr_reader :element

  def initialize(element)
    @element = element
  end

  def urls
    Rails.application.routes.url_helpers
  end

  def respond_to_missing?(method, include_all)
    element.respond_to?(method, false)
  end

  def method_missing(method, *args, &block)
    if element.respond_to?(method)
      element.public_send(method, *args, &block)
    else
      super
    end
  end

end
