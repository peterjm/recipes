require 'lib_test_helper'
require 'striplines'

class StriplinesTest < ActiveSupport::TestCase

  test "#striplines strips whitespace around internal lines" do
    original = "foo  \n\n  bar"
    expected = "foo\n\nbar"
    assert_equal expected, original.striplines
  end

  test "#striplines strips leading and trailing whitespace" do
    original = "\t foo \t"
    expected = "foo"
    assert_equal expected, original.striplines
  end

  test "#striplines strips unicode line separators" do
    original = "\u2028 foo"
    expected = "foo"
    assert_equal expected, original.striplines
  end

end
