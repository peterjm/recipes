require 'test_helper'

class IngredientListParserTest < ActiveSupport::TestCase

  test "parses lines from a block of text" do
    assert_lines_found [
      "1 tomato",
      "1 bunch basil",
      "10 slices of mazzarella cheese"
    ] , <<-INGREDIENTS
      1 tomato
      1 bunch basil
      10 slices of mazzarella cheese
    INGREDIENTS
  end

  test "ignores blank lines" do
    assert_lines_found [
      "1 bunch basil"
    ] , <<-INGREDIENTS

      1 bunch basil

    INGREDIENTS
  end

  private

  def assert_lines_found(expected_lines, text)
    parser = IngredientListParser.new(text)
    parsed_lines = parser.ingredient_lines
    assert_equal expected_lines, parsed_lines
  end

end
