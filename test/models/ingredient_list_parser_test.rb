require 'test_helper'

class IngredientListParserTest < ActiveSupport::TestCase

  test "parses list from a block of text" do
    assert_list_found [
      "1 tomato",
      "1 bunch basil",
      "10 slices of mazzarella cheese"
    ] , <<-INGREDIENTS
      1 tomato
      1 bunch basil
      10 slices of mazzarella cheese
    INGREDIENTS
  end

  test "ignores leading and trailing blank lines" do
    assert_list_found [
      "1 tomato",
      "",
      "1 bunch basil"
    ] , <<-INGREDIENTS

      1 tomato

      1 bunch basil

    INGREDIENTS
  end

  private

  def assert_list_found(expected_list, text)
    parser = IngredientListParser.new(text)
    parsed_list = parser.list
    assert_equal expected_list, parsed_list
  end

end
