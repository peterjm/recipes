module Resourceful
  extend ActiveSupport::Concern

  included do
    attr_accessor :resource
    alias_method :resources, :resource
    helper_method :resource, :resources
  end

  def respond_with(*args, &block)
    options = args.extract_options!
    self.resource = args.last
    super(*args, options, *block)
  end

  module ClassMethods

    def resource(name, options={})
      alias_method name, :resource
      alias_method name.to_s.pluralize, :resources
      helper_method name.to_s.pluralize, name
    end

  end
end
