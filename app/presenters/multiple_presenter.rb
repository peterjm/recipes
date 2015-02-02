class MultiplePresenter
  include Enumerable
  extend Forwardable

  attr_reader :source, :klass, :args

  def initialize(source, klass, *args)
    @source = source
    @klass = klass
    @args = args
  end

  def each
    source.each do |elem|
      yield klass.new(elem, *args)
    end
  end

end
