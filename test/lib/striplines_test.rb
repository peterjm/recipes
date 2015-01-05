require 'lib_test_helper'
require 'striplines'

class StriplinesTest < ActiveSupport::TestCase

  test "#striplines strips whitespace around internal lines" do
    original = "foo  \n\n  bar"
    expected = "foo\n\nbar"
    assert_equal expected, original.striplines
  end

end
