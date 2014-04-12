module Resourceful
  module Presenting
    extend ActiveSupport::Concern

    included do
      class_attribute :presenter_class
    end

    protected

    def respond_with(*args, &block)
      options = args.extract_options!
      resource = args.pop
      super(*args, presenter_wrap(resource), options, *block)
    end

    private

    def presenter_wrap(resource)
      if klass = self.class.presenter_class
        klass.wrap(resource)
      else
        resource
      end
    end
  end
end
