class Presenter
  extend Forwardable

  def_delegators :element, :to_param

  def self.wrap(element_or_elements)
    if element_or_elements.respond_to?(:each)
      element_or_elements.map{|element| new(element)}
    else
      new(element_or_elements)
    end
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
