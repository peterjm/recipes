require 'test_helper'

class HTMLParserTest < ActiveSupport::TestCase
  class ExampleParser < Parsers::HTMLParser
    attr_accessor :title, :notes, :ingredients_text, :instructions_text

    def initialize
      super("not used")
    end
  end

  def parser
    @parser ||= ExampleParser.new
  end

  test "#parse returns a hash of attributes" do
    parser.title = "the title"
    parser.instructions_text = "the instructions"
    parser.ingredients_text = "the ingredients"
    attrs = parser.parse
    assert_equal "the title", attrs[:title]
    assert_equal "the instructions", attrs[:instructions_text]
    assert_equal "the ingredients", attrs[:ingredients_text]
  end
end
