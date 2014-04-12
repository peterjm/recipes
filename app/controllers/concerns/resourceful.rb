module Resourceful
  extend ActiveSupport::Concern

  included do
    include Resourceful::Presenting

    attr_accessor :resource
    alias_method :resources, :resource
    helper_method :resource, :resources
  end

  protected

  def respond_with(*args, &block)
    options = args.extract_options!
    self.resource = args.last
    super(*args, options, *block)
  end

  module ClassMethods

    def resource(name, options={})
      self.presenter_class = options[:presenter]

      names = name.to_s.pluralize
      alias_method name, :resource
      alias_method names, :resources
      helper_method names, name
    end

  end
end
