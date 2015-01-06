require 'test_helper'

class HTMLParserTest < ActiveSupport::TestCase
  class ExampleParser < Parsers::HTMLParser
    attr_accessor :title, :notes, :ingredients, :instructions

    def initialize
      super("not used")
    end
  end

  def parser
    @parser ||= ExampleParser.new
  end

  test "#parse returns a hash of attributes" do
    parser.title = "the title"
    parser.notes = "the notes"
    parser.instructions = "the instructions"
    parser.ingredients = "the ingredients"
    attrs = parser.parse
    assert_equal "the title", attrs[:title]
    assert_equal "the notes", attrs[:notes]
    assert_equal "the instructions", attrs[:instructions_text]
    assert_equal "the ingredients", attrs[:ingredients_text]
  end
end
